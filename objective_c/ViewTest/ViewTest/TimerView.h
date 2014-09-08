//
//  TimerView.h
//  ViewTest
//
//  Created by B02681 on 2014/09/08.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TimerViewDelegate <NSObject>

-(void)endTimer;
-(void)endTimerWithMessage:(NSString*)message;

@end




// TimerView
@interface TimerView : UIView

@property (nonatomic, strong) NSString* message;

@property (nonatomic, assign) id<TimerViewDelegate> delegate;

-(void)timerFunc1:(NSString*)message;

@end
