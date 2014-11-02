//
//  UNButton.m
//  ViewTest
//
//  Created by B02681 on 2014/10/31.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import "UNButton.h"
#import "UNImageView.h"
#import "PRTween.h"
#import "UNEffect1.h"

#define PI          3.141592
#define RADIAN      (PI / 180)         // ラジアン角


@interface UNButton ()
{
    PRTweenOperation *activeTweenOperation;
    NSInteger _pushCount;
    CGFloat _scale;         // アニメーション時の最大スケール
    CGFloat _oldScale;          // １フレーム前のscale
    BOOL _isImageChanged;       // 画像を更新したかどうか
}

// 右のきらきらエフェクト
@property (nonatomic, strong) UNEffect1 *rightEffect;
// 左のきらきらエフェクト
@property (nonatomic, strong) UNEffect1 *leftEffect;

// サイズを変更する前のサイズ
@property (nonatomic) CGRect baseFrame;

@end

@implementation UNButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.baseFrame = self.frame;
        _pushCount = 0;
        // 画像を設定
        [self setImage:[UIImage imageNamed:@"zabuton_0"] forState:UIControlStateNormal];
        self.adjustsImageWhenHighlighted = NO;
        // ボタンが押されたときに呼ばれるメソッドを設定
        [self addTarget:self
                   action:@selector(buttonTouchDown:)
         forControlEvents:UIControlEventTouchDown];
        
        // ボタンがタップされたときの処理
        [self addTarget:self
                 action:@selector(buttonTouchUpInside:)
       forControlEvents:UIControlEventTouchUpInside];
        
        // ボタン外でTouchUp
        [self addTarget:self
                 action:@selector(buttonTouchUpOutside:)
       forControlEvents:UIControlEventTouchDragExit];
        
        // 画像をサイズいっぱいにする
        self.contentHorizontalAlignment=UIControlContentHorizontalAlignmentFill;
        self.contentVerticalAlignment=UIControlContentVerticalAlignmentFill;
        
    }
    return self;
}

/*
 * ボタンを押したときの処理
 */
- (void)buttonTouchDown:(UIButton*)button
{
    [[PRTween sharedInstance] removeTweenOperation:activeTweenOperation];
    
#if 1
    _pushCount = 0;
    _isImageChanged = NO;
    [self setImage:[UIImage imageNamed:@"zabuton_0"] forState:UIControlStateNormal];
#endif
    // 中央の座標
    CGPoint center = self.center;
    
    PRTweenPeriod *period = [PRTweenPeriod periodWithStartValue:1.0 endValue:0.9 duration:0.2];
    
    activeTweenOperation = [[PRTween sharedInstance] addTweenPeriod:period
                                                        updateBlock:^(PRTweenPeriod *period) {
                                                            CGFloat scale = period.tweenedValue;
                                                            CGSize size = CGSizeMake(self.baseFrame.size.width * scale, self.baseFrame.size.height * scale);
                                                            self.frame = CGRectMake(center.x - size.width / 2,
                                                                                    center.y - size.height / 2,
                                                                                    size.width,
                                                                                    size.height);
                                                            
                                                        } completionBlock:^(void) {
                                                        }];
}

/*
 * ボタンを離した スケールが 0.9->1.6->1.0で遷移
 */
- (void)buttonTouchUpInside:(UIButton*)button
{
    
    //        UIView *view1 = [[UIView alloc]initWithFrame:self.frame];
//    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(100, 350, 93, 72)];
//    view1.backgroundColor = [UIColor redColor];
//    view1.hidden = NO;
//    [self.superview addSubview:view1];
    
    [self pushAnimation2];
}

- (void)pushAnimation2
{
    NSLog(@"buttonTouchUpInside");
    [[PRTween sharedInstance] removeTweenOperation:activeTweenOperation];
    CGPoint center = self.center;
    _scale = (_pushCount < 1) ? 0.2 : 0.35;
    
    PRTweenPeriod *period = [PRTweenPeriod periodWithStartValue:270.0 endValue:582.0 duration:0.4];
    activeTweenOperation = [[PRTween sharedInstance] addTweenPeriod:period
                                                        updateBlock:^(PRTweenPeriod *period) {
                                                            // scale は 0.9 -> 1.6 -> 1.0
                                                            CGFloat scale = 0.9 + (sin( period.tweenedValue * RADIAN ) + 1.0) * _scale;
                                                            NSLog(@"scale %f", _scale);
                                                            CGSize size = CGSizeMake(self.baseFrame.size.width * scale, self.baseFrame.size.height * scale);
                                                            
                                                            self.frame = CGRectMake(center.x - size.width / 2,
                                                                                    center.y - size.height / 2,
                                                                                    size.width,
                                                                                    size.height);
                                                            // scaleが最大になったあたりで画像を変更
                                                            if( !_isImageChanged && _oldScale > scale){
                                                                _isImageChanged = YES;
                                                                switch(_pushCount){
                                                                    case 0:
                                                                        [self setImage:[UIImage imageNamed:@"zabuton_1"] forState:UIControlStateNormal];
                                                                        [self startEffectAnimation];
                                                                        break;
                                                                    case 1:
                                                                        [self setImage:[UIImage imageNamed:@"zabuton_2"] forState:UIControlStateNormal];
                                                                        [self startEffectAnimation];
                                                                        break;
                                                                    case 2:
                                                                        [self setImage:[UIImage imageNamed:@"zabuton_3"] forState:UIControlStateNormal];
                                                                        [self startEffectAnimation];
                                                                        break;
                                                                }
                                                            }
                                                            _oldScale = scale;
                                                        } completionBlock:^(void) {
                                                            _isImageChanged = NO;
                                                            _oldScale = 0.0;
                                                            switch(_pushCount){
                                                                case 0:
                                                                case 1:
                                                                    [self pushAnimation2];
                                                                    break;
                                                                case 2:
                                                                    if (self.endAnimatedCompletion) {
                                                                        self.endAnimatedCompletion();
                                                                    }
                                                                    break;
                                                            }
                                                            _pushCount++;
                                                        }];
}


/*
 * ボタンを範囲外で離したときの処理
 */
- (void)buttonTouchUpOutside:(UIButton*)button
{
    NSLog(@"buttonTouchUpOutside");
    [[PRTween sharedInstance] removeTweenOperation:activeTweenOperation];
    CGPoint center = self.center;

    PRTweenPeriod *period = [PRTweenPeriod periodWithStartValue:270.0 endValue:560.0 duration:0.5];
    activeTweenOperation = [[PRTween sharedInstance] addTweenPeriod:period
                                                        updateBlock:^(PRTweenPeriod *period) {
                                                            // scale は 0.9 -> 1.2 -> 1.0
                                                            CGFloat scale = 0.9 + (sin( period.tweenedValue * RADIAN ) + 1.0) * 0.15;
                                                            NSLog(@"%f %f %f", period.tweenedValue, sin( period.tweenedValue * RADIAN ) + 1.0, scale);
                                                            CGSize size = CGSizeMake(self.baseFrame.size.width * scale, self.baseFrame.size.height * scale);
                                                            
                                                            self.frame = CGRectMake(center.x - size.width / 2,
                                                                                    center.y - size.height / 2,
                                                                                    size.width,
                                                                                    size.height);
                                                            
                                                        } completionBlock:^(void) {
                                                        }];
}


#pragma mark - Flash Animation

/*
 * 座布団から出るキラキラアニメーション
 */
- (void)startEffectAnimation
{
    if (!self.rightEffect){
        self.rightEffect = [[UNEffect1 alloc]initWithImage:[UIImage imageNamed:@"zabuton_effect_right"]];
        [self.superview addSubview:self.rightEffect];
        self.rightEffect.baseCenter = CGPointMake(self.baseFrame.origin.x + self.baseFrame.size.width,
                                                  self.baseFrame.origin.y);
    }
    if (!self.leftEffect){
        self.leftEffect = [[UNEffect1 alloc]initWithImage:[UIImage imageNamed:@"zabuton_effect_left"]];
        [self.superview addSubview:self.leftEffect];
        self.leftEffect.baseCenter = CGPointMake(self.baseFrame.origin.x,
                                                  self.baseFrame.origin.y);
    }
    [self.rightEffect startAnimation:UNEffectModeRight];
    [self.leftEffect startAnimation:UNEffectModeLeft];
}


@end
