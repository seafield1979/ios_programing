//
//  ViewController.m
//  UNTabBarController
//
//  Created by UnnoShusuke on 2014/10/08.
//  Copyright (c) 2014年 UnnoShusuke. All rights reserved.
//

#import "ViewController.h"
#import "TabBarController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
 * タブバーを表示するボタン
 */
- (IBAction)showTabBarButtonDidTap:(id)sender {
    [[TabBarController sharedController] showAnimated:YES];
}

/*
 * タブバーを非表示にするボタン
 */
- (IBAction)hideTabBarDidTap:(id)sender {
    [[TabBarController sharedController] showAnimated:NO];
}

- (IBAction)buttonDidTap:(id)sender {
}



@end
