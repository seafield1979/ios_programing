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
#import "ViewControllerPRTween.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ViewController *viewController; // 追加
@property (strong, nonatomic) ViewController2 *viewController2; // 追加
@property (strong, nonatomic) ViewController3 *viewController3; // 追加
@property (strong, nonatomic) ViewControllerPRTween *viewControllerTween; // 追加


@end
