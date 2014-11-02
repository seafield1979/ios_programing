//
//  UNEffect1.m
//  ViewTest
//
//  Created by UnnoShusuke on 2014/11/01.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import "UNEffect1.h"

#define kEffectStartScale  (0.8)       // きらきらエフェクトの初期スケール
#define kEffectEndScale (1.6)          // きらきらエフェクトの終了スケール

@interface UNEffect1 ()
{
}
@end

@implementation UNEffect1

- (id)initWithImage:(UIImage *)image
{
    self = [super initWithImage:image];
    if (self){
        self.contentMode = UIViewContentModeScaleAspectFill;
    }
    return self;
}

/*
 * きらきらアニメーション開始
 */
- (void)startAnimation:(UNEffectMode)mode
{
    CGFloat startWidth = self.baseFrame.size.width * kEffectStartScale;
    CGFloat startHeight = self.baseFrame.size.height * kEffectStartScale;
    self.frame = CGRectMake(self.baseCenter.x - startWidth / 2,
                       self.baseCenter.y - startHeight / 2,
                       startWidth,
                       startHeight);
    self.alpha = 1.0;
    self.hidden = NO;
    LogFrame(self.frame);
    
    // animation
    [UIView animateWithDuration:0.3
                     animations:^(void){
                         self.alpha = 0.0f;
                         CGFloat width = self.baseFrame.size.width * kEffectEndScale;
                         CGFloat height = self.baseFrame.size.height * kEffectEndScale;
                         self.frame = CGRectMake(self.baseCenter.x - width / 2 + ((mode == UNEffectModeLeft) ? -30 : 30),
                                                 self.baseCenter.y - height / 2 - 10,
                                                 width,
                                                 height);
                     }
                     completion:^(BOOL finished){
                         self.hidden = YES;
                     }];

}

#pragma mark - Accessor

/*
 * 中心座標を設定
 * baseCenter と baseFrameに設定
 */
- (void)setBaseCenter:(CGPoint)center
{
    _baseCenter = center;
    self.baseFrame = CGRectMake(center.x - self.frame.size.width / 2,
                                center.y - self.frame.size.height / 2,
                                self.frame.size.width, self.frame.size.height);
    NSLog(@"%f %f %f %f %f %f", _baseCenter.x, _baseCenter.y,
                            self.baseFrame.origin.x, self.baseFrame.origin.y,
                            self.baseFrame.size.width, self.baseFrame.size.height);
}


@end
