//
//  UNImageView.h
//  ViewTest
//
//  Created by B02681 on 2014/10/30.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

@interface UNImageView : UIImageView

// サイズを変更する前のサイズ
@property (nonatomic) CGRect baseFrame;

- (void)scaleLinerWithStartValue:(CGFloat)startValue endValue:(CGFloat)endValue duration:(CGFloat)duration completion:(void (^)(void))completion;

- (void)scaleBoundWithScale:(CGFloat)scale delay:(CGFloat)delay duration:(CGFloat)duration completion:(void (^)(void))completion;

// 点滅
- (void)blinkWithInterval:(CGFloat)interval;
- (void)stopBlinkWithHidden:(BOOL)hidden;

- (void)startBlinkAlphaWithInterval:(CGFloat)interval;
- (void)blinkAlphaWithInterval:(CGFloat)interval;
- (void)stopBlinkAlphaWithHidden:(BOOL)hidden;
@end
