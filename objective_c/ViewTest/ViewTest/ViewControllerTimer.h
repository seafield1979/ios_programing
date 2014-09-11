//
//  ViewControllerTimer.h
//  ViewTest
//
//  Created by B02681 on 2014/09/08.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimerView.h"

@interface ViewControllerTimer : UIViewController <TimerViewDelegate>


- (IBAction)timer1ButtonDidTap:(id)sender;
- (IBAction)timer2ButtonDidTap:(id)sender;


@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) TimerView *timerView;

@end
