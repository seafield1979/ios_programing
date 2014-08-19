//
//  AppDelegate.h
//  ViewControllerTest
//
//  Created by 海野 秀祐 on 2014/08/04.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "ViewController2.h"
#import "TableViewController.h"
#import "TableViewController2.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic) ViewController2 *viewController2;
@property (strong, nonatomic) TableViewController *tableViewController;
@property (strong, nonatomic) TableViewController2 *tableViewController2;

@end
