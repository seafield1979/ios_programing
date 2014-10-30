//
//  UIView+Draw.m
//  ViewTest
//
//  Created by B02681 on 2014/10/30.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import "UIView+Draw.h"

@implementation UIView (Draw)

/*
 * 最小からもとのサイズに拡大
 */
- (void)scaleUp
{
    CGRect frame = self.frame;
    self.frame = CGRectMake(frame.origin.x, frame.origin.y, 0, 0);
    
    [UIView animateWithDuration:1.0 animations:^(void){
        self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
    }];
}

@end
