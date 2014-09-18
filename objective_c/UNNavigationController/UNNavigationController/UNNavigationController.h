//
//  UNNavigationController.h
//  UNNavigationController
//
//  Created by UnnoShusuke on 2014/08/24.
//  Copyright (c) 2014年 UnnoShusuke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UNNavigationController : UINavigationController

@property (nonatomic, strong) UIButton *logoButton;

@property (retain, nonatomic) UIView *leftBarItem;
@property (retain, nonatomic) UIView *rightBarItem;
@property (retain, nonatomic) UIView *centerBarItem2;
@property (retain, nonatomic) UIView *blankBarItem;
@property (strong, nonatomic) UIButton *backButton;

@property (assign) CGRect centerBarItemRect;
@property (assign) CGRect leftBarItemRect;
@property (assign) CGRect rightBarItemRect;

@end
