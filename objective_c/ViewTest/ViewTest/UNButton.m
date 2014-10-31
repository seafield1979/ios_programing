//
//  UNButton.m
//  ViewTest
//
//  Created by B02681 on 2014/10/31.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import "UNButton.h"
#import "PRTween.h"

#define PI          3.141592
#define RADIAN      (PI / 180)         // ラジアン角

@interface UNButton ()
{
    PRTweenOperation *activeTweenOperation;
}
// サイズを変更する前のサイズ
@property (nonatomic) CGRect baseFrame;

@end

@implementation UNButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.baseFrame = self.frame;
        // 画像を設定
        [self setImage:[UIImage imageNamed:@"button1"] forState:UIControlStateNormal];
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
        
    }
    return self;
}

/*
 * ボタンを押したときの処理
 */
- (void)buttonTouchDown:(UIButton*)button
{
    [[PRTween sharedInstance] removeTweenOperation:activeTweenOperation];
    
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
    NSLog(@"buttonTouchUpInside");
    [[PRTween sharedInstance] removeTweenOperation:activeTweenOperation];
    CGPoint center = self.center;

    PRTweenPeriod *period = [PRTweenPeriod periodWithStartValue:270.0 endValue:582.0 duration:0.5];
    activeTweenOperation = [[PRTween sharedInstance] addTweenPeriod:period
                                                        updateBlock:^(PRTweenPeriod *period) {
                                                            // scale は 0.9 -> 1.6 -> 1.0
                                                            CGFloat scale = 0.9 + (sin( period.tweenedValue * RADIAN ) + 1.0) * 0.35;
                                                            NSLog(@"%f %f %f", period.tweenedValue, sin( period.tweenedValue * RADIAN ) + 1.0, scale);
                                                            CGSize size = CGSizeMake(self.baseFrame.size.width * scale, self.baseFrame.size.height * scale);
                                                            
                                                            self.frame = CGRectMake(center.x - size.width / 2,
                                                                                    center.y - size.height / 2,
                                                                                    size.width,
                                                                                    size.height);
                                                            
                                                        } completionBlock:^(void) {
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


@end
