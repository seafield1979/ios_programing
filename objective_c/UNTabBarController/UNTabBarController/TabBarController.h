//
//  TabBarController.h
//  UNTabBarController
//
//  Created by UnnoShusuke on 2014/10/08.
//  Copyright (c) 2014年 UnnoShusuke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabBarController : UITabBarController

+ (TabBarController *)sharedController;

@property (strong, nonatomic) IBOutlet UIView *originalTabbar;

- (IBAction)tabButtonDidTap:(id)sender;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *tabbars;
@end
