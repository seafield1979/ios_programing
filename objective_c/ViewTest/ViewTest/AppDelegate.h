//
//  AppDelegate.h
//  ViewTest
//
//  Created by 海野 秀祐 on 2014/08/04.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "ViewController2.h"
#import "ViewController3.h"
#import "ViewController4.h"
#import "ViewControllerAd.h"
#import "ViewControllerPRTween.h"
#import "ViewControllerNib.h"
#import "ViewControllerTimer.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic) ViewController2 *viewController2;
@property (strong, nonatomic) ViewController3 *viewController3;
@property (strong, nonatomic) ViewController4 *viewController4;
@property (strong, nonatomic) ViewControllerAd *viewControllerAd;
@property (strong, nonatomic) ViewControllerNib *viewControllerNib;
@property (strong, nonatomic) ViewControllerPRTween *viewControllerTween;
@property (strong, nonatomic) ViewControllerTimer *viewControllerTimer;


@end
