//
//  TimerView.m
//  ViewTest
//
//  Created by B02681 on 2014/09/08.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import "TimerView.h"

@implementation TimerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
 * 外部から呼ばれるメソッド
 */
-(void)timerFunc1:(NSString *)message
{
    _message = message;
    
    // タイマー開始
    [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(timerEndFunc:)
                                   userInfo:nil
                                    repeats:NO];
}

/*
 * タイマー終了時の処理
 */
-(void)timerEndFunc:(NSTimer*)timer
{
    NSLog(@"timerEndFunc:");

    if(_message){
        if ([self.delegate respondsToSelector:@selector(endTimerWithMessage:)]) {
            [self.delegate endTimerWithMessage:_message];
        }
    }
    else{
        if ([self.delegate respondsToSelector:@selector(endTimer)]) {
            [self.delegate endTimer];
        }
    }
}

@end
