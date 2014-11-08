//
//  UNImageView.h
//  ViewTest
//
//  Created by B02681 on 2014/10/30.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

@interface UNImageView : UIImageView



- (void)scaleLinerWithStartValue:(CGFloat)startValue endValue:(CGFloat)endValue duration:(CGFloat)duration completion:(void (^)(void))completion;

- (void)scaleBoundWithScale:(CGFloat)scale delay:(CGFloat)delay duration:(CGFloat)duration completion:(void (^)(void))completion;

// 点滅
- (void)blinkWithInterval:(CGFloat)interval;
- (void)stopBlinkWithHidden:(BOOL)hidden;

// 点滅(アルファ)
- (void)startBlinkAlphaWithInterval:(CGFloat)interval;
- (void)blinkAlphaWithInterval:(CGFloat)interval;
- (void)stopBlinkAlphaWithHidden:(BOOL)hidden;

// 上下ぶるぶる
- (void)startShakeYWithDelay:(CGFloat)delay moveX:(CGFloat)moveX moveY:(CGFloat)moveY;

// 出現ぶるぶる
- (void)startScaleAndShake;

@end
