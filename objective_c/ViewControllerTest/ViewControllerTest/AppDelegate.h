//
//  AppDelegate.h
//  ViewControllerTest
//
//  Created by 海野 秀祐 on 2014/08/04.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewController.h"
#import "TableViewController2.h"
#import "TableViewController3.h"
#import "UNViewController1.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UNViewController1 *viewController1;
@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) TableViewController *tableViewController;
@property (strong, nonatomic) TableViewController2 *tableViewController2;
@property (strong, nonatomic) TableViewController3 *tableViewController3;

@end
