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

@interface UNImageView ()
{
    PRTweenOperation *activeTweenOperation;
    BOOL _blinkAlpha;                   // アルファ点滅中
    BOOL _blinkAlphaMode;               // アルファ点滅のモード
    BOOL _blinkStopFlag;                // アルファ点滅の停止フラグ
    BOOL _blinkHidden;                  // アルファ点滅の停止時のhiddenフラグ
}

@property (nonatomic, strong) NSTimer *blinkTimer;

@end

@implementation UNImageView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.baseFrame = self.frame;
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

@end
