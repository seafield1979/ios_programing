//
//  UNImageView.m
//  ViewTest
//
//  Created by B02681 on 2014/10/30.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import "UNImageView.h"
#import "PRTween.h"

#define PI          3.141592
#define RADIAN      (PI / 180)         // ラジアン角
#define BOUND_DIG   (120.0)       // バウンドの終了角度

// 出現＆ぶるぶるアニメーション
#define kAffineScaleTime      (0.15)
#define kAffineAppearTime     (0.6)
#define kAffineReturnTime     (0.6)
#define kAffineAppearScale    (1.5)
#define kAffineAnimScale      (0.8)
#define kAffineRotateValue    (30.0)

typedef NS_ENUM (NSInteger, UNAnimateMode)
{
    UNAnimateModeAppear = 0,
    UNAnimateModeScale1,
    UNAnimateModeScale2,
    UNAnimateModeStop,
    UNAnimateModeReturn
};

@interface UNImageView ()
{
    PRTweenOperation *activeTweenOperation;
    BOOL _blinkAlpha;                   // アルファ点滅中
    BOOL _blinkAlphaMode;               // アルファ点滅のモード
    BOOL _blinkStopFlag;                // アルファ点滅の停止フラグ
    BOOL _blinkHidden;                  // アルファ点滅の停止時のhiddenフラグ
    
    NSInteger _shakeAnimCount;
    CGAffineTransform _baseTransform;     // ぶるぶるアニメーションのベースTransform
}
// サイズを変更する前のサイズ
@property (nonatomic) CGRect baseFrame;
@property (nonatomic, strong) NSTimer *blinkTimer;

@end

@implementation UNImageView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.baseFrame = self.frame;
        
        UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapView:)];
        [self addGestureRecognizer:tapGesture];
        
        //タップを有効化する。
        self.userInteractionEnabled = YES;

    }
    return self;
}



/*
 * 線形の拡大縮小
 */
- (void)scaleLinerWithStartValue:(CGFloat)startValue endValue:(CGFloat)endValue duration:(CGFloat)duration completion:(void (^)(void))completion
{
    // 中央の座標
    CGPoint center = self.center;
    
    // 開始時のサイズ
    self.frame = CGRectMake(center.x, center.y, self.baseFrame.size.width * startValue, self.baseFrame.size.height * endValue);
    
    // アニメーション
    [UIView animateWithDuration:duration animations:^(void){
        CGSize size = CGSizeMake(self.baseFrame.size.width * endValue, self.baseFrame.size.height * endValue);
        
        self.frame = CGRectMake(center.x - size.width / 2,
                                center.y - size.height / 2,
                                size.width,
                                size.height);
    }];
}

/*
 * バウンド拡大縮小する  チュートリアルパーツ出現用
 * @param startValue  開始値
 * @param endValue
 * @param delay
 * @param duration
 * @param completion
 */
- (void)scaleBoundWithScale:(CGFloat)scale delay:(CGFloat)delay duration:(CGFloat)duration completion:(void (^)(void))completion
{
    [[PRTween sharedInstance] removeTweenOperation:activeTweenOperation];
    
    // 中央の座標
    CGPoint center = self.center;
    
    self.frame = CGRectMake(center.x, center.y, 0, 0);
    
    PRTweenPeriod *period = [PRTweenPeriod periodWithStartValue:0.0 endValue:BOUND_DIG duration:duration];
    period.delay = delay;
    
    activeTweenOperation = [[PRTween sharedInstance] addTweenPeriod:period
                                                        updateBlock:^(PRTweenPeriod *period) {
                                                            CGFloat rad = period.tweenedValue * RADIAN;
                                                            CGFloat scaleNow = sin(rad) / sin(BOUND_DIG * RADIAN) * scale;
                                                            CGSize size = CGSizeMake(self.baseFrame.size.width * scaleNow, self.baseFrame.size.height * scaleNow);
                                                            
                                                            self.frame = CGRectMake(center.x - size.width / 2,
                                                                                    center.y - size.height / 2,
                                                                                    size.width,
                                                                                    size.height);
                                                            
                                                        } completionBlock:^(void) {
                                                            if(completion){
                                                                completion();
                                                            }
                                                        }];
}

/*
 * 点滅させる
 * @param interval インターバル
 */
- (void)blinkWithInterval:(CGFloat)interval
{
    if (self.blinkTimer) {
        [self stopBlinkWithHidden:NO];
    }
    else {
        self.blinkTimer =
        [NSTimer
         scheduledTimerWithTimeInterval:interval
         target:self
         selector:@selector(blinkTimerFunc:)
         userInfo:nil
         repeats:YES
         ];
    }
}

/*
 * 点滅のタイマーイベント
 */
-(void)blinkTimerFunc:(NSTimer*)timer{
    self.hidden = !self.hidden;
}

/*
 * 点滅を停止
 */
-(void)stopBlinkWithHidden:(BOOL)hidden
{
    [self.blinkTimer invalidate];
    self.blinkTimer = nil;
    self.hidden = hidden;
}

#pragma mark - Blink alpha method


/*
 * 点滅（アルファ）開始
 */
- (void)startBlinkAlphaWithInterval:(CGFloat)interval
{
    if (_blinkAlpha) {
        // 動作中なら停止
        _blinkAlpha = NO;
        [self stopBlinkAlphaWithHidden:YES];
    }
    else {
        _blinkAlpha = YES;
        _blinkAlphaMode = NO;
        [self blinkAlphaWithInterval:interval];
    }
}

/*
 * 点滅（アルファ）
 */
- (void)blinkAlphaWithInterval:(CGFloat)interval
{
    [UIView animateWithDuration:0.8 animations:^(void){
        self.alpha = _blinkAlphaMode ? 0.0 : 1.0;
        _blinkAlphaMode = !_blinkAlphaMode;
    }
    completion:^(BOOL finished){
        if (_blinkStopFlag &&
            _blinkHidden != _blinkAlphaMode)
        {
            _blinkStopFlag = NO;
            // nothing to do
        }
        else{
            [self blinkAlphaWithInterval:interval];
        }
    }];
}

/*
 * 点滅（アルファ）を停止する
 * @param hidden     どの状態で停止するか
 * @param immediate  即座に停止するか NOなら次のブリンクのタイミングで停止する
 */
- (void)stopBlinkAlphaWithHidden:(BOOL)hidden
{
    _blinkStopFlag = YES;
    _blinkHidden = hidden;
}

#pragma mark - Shake method

- (void)startShakeYWithDelay:(CGFloat)delay moveX:(CGFloat)moveX moveY:(CGFloat)moveY
{
    [[PRTween sharedInstance] removeTweenOperation:activeTweenOperation];
    PRTweenPeriod *period = [PRTweenPeriod periodWithStartValue:270.0 endValue:(270.0+360 * 4.0) duration:2.0];
    period.delay = delay;

    activeTweenOperation =
    [[PRTween sharedInstance] addTweenPeriod:period
                                 updateBlock:^(PRTweenPeriod *period) {
                                     if (period.tweenedValue < 270 + 360 * 2){
                                         CGFloat move = sin(period.tweenedValue * RADIAN) + 1.0;
                                         CGFloat x = move * moveX;
                                         CGFloat y = move * moveY;
                                         self.frame = CGRectMake(self.baseFrame.origin.x + x, self.baseFrame.origin.y + y, self.frame.size.width, self.frame.size.height);
                                         NSLog(@"%f %f", period.tweenedValue, y);
                                         
                                     }
                                 }completionBlock:^(void) {
                                     // 繰り返し
                                     [self startShakeYWithDelay:0.0 moveX:moveX moveY:moveY];
                                 }
                                 timingFunction: &PRTweenTimingFunctionLinear];
}

- (void)stopShakeY
{
    [[PRTween sharedInstance] removeTweenOperation:activeTweenOperation];
}

- (void)tapView:(UIPanGestureRecognizer *)panGesture
{
    NSLog(@"tapView");
    panGesture.enabled = NO;
}

#pragma mark - Shake2 method

- (void)startScaleAndShake
{
    _shakeAnimCount = 0;
    
    [self nextAnimation];
}

- (void)affine1:(void (^)(void))completion
{
    // 初期設定
    self.alpha = 0.0;
    CGAffineTransform t11 = CGAffineTransformMakeScale(0.2, 0.2);
    _baseTransform = CGAffineTransformRotate(t11, 0.0);
    //    _baseTransform = t11;
    self.transform = _baseTransform;
    
    [UIView animateWithDuration:0.6 delay:0.0
                        options:0 animations:^(){
                            self.alpha = 1.0;
                            // ビューを回転
                            float angle = -30 * M_PI / 180;
                            CGAffineTransform t1 = CGAffineTransformMakeRotation(angle);
                            // 拡大
                            CGAffineTransform t2 = CGAffineTransformScale(t1, kAffineAppearScale, kAffineAppearScale);
                            _baseTransform = t2;
                            self.transform = _baseTransform;
                            
                        }
                     completion:^(BOOL finished){
                         if(completion){
                             completion();
                         }
                     }];
}
/*
 * 縮小
 */
- (void)affine2:(void (^)(void))completion
{
    [UIView animateWithDuration:kAffineScaleTime animations:^(void){
        //        float angle = 30 * M_PI / 180;
        //        _baseTransform = CGAffineTransformRotate(_baseTransform, angle);
        
        _baseTransform = CGAffineTransformScale(_baseTransform, kAffineAnimScale, kAffineAnimScale);
        
        self.transform = _baseTransform;
    }
                     completion:^(BOOL finished){
                         if(completion){
                             completion();
                         }
                     }];
}
/*
 * 拡大
 */
- (void)affine3:(void (^)(void))completion
{
    [UIView animateWithDuration:kAffineScaleTime animations:^(void){
        //        float angle = -30 * M_PI / 180;
        //        _baseTransform = CGAffineTransformRotate(_baseTransform, angle);
        
        CGFloat scale = 1.0/kAffineAnimScale;
        _baseTransform = CGAffineTransformScale(_baseTransform, scale, scale);
        
        self.transform = _baseTransform;
    }
                     completion:^(BOOL finished){
                         if(completion){
                             completion();
                         }
                     }];
}
/*
 * 戻る
 */
- (void)affine4:(void (^)(void))completion
{
    [UIView animateWithDuration:kAffineReturnTime animations:^(void){
        // ビューを回転
        float angle = kAffineRotateValue * M_PI / 180;
        _baseTransform = CGAffineTransformRotate(_baseTransform, angle);
        CGFloat scale = 1.0 / kAffineAppearScale;
        _baseTransform = CGAffineTransformScale(_baseTransform, scale, scale);
        
        self.transform = _baseTransform;
    }
                     completion:^(BOOL finished){
                         if(completion){
                             completion();
                         }
                     }];
}

/*
 * 停止
 */
- (void)animateStop:(void (^)(void))completion
{
    [self performSelector:@selector(stopCompletion:) withObject:completion afterDelay:0.8];
}
- (void)stopCompletion:(void (^)())completion
{
    completion();
}

- (void)nextAnimation
{
    const NSArray *animationList = @[@(UNAnimateModeAppear),
                                     @(UNAnimateModeScale1),
                                     @(UNAnimateModeScale2),
                                     @(UNAnimateModeScale1),
                                     @(UNAnimateModeScale2),
                                     @(UNAnimateModeScale1),
                                     @(UNAnimateModeScale2),
                                     @(UNAnimateModeStop),
                                     @(UNAnimateModeReturn)];
    
    if (_shakeAnimCount >= animationList.count){
        return;
    }
    UNAnimateMode mode = (UNAnimateMode)([animationList[_shakeAnimCount] intValue]);
    
    switch(mode){
        case UNAnimateModeAppear:
        {
            [self affine1:^(){[self nextAnimation];}];
        }
            break;
        case UNAnimateModeScale1:
        {
            [self affine2:^(){[self nextAnimation];}];
        }
            break;
        case UNAnimateModeScale2:
        {
            [self affine3:^(){[self nextAnimation];}];
        }
            break;
        case UNAnimateModeStop:
        {
            [self animateStop:^(void){[self nextAnimation];}];
        }
            break;
        case UNAnimateModeReturn:
        {
            [self affine4:^(){[self nextAnimation];}];
        }
            break;
            
        default:
            return;
    }
    _shakeAnimCount++;
}


@end
