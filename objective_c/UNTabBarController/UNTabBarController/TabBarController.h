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
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *tabbars;

- (IBAction)tabButtonDidTap:(id)sender;
- (void)showAnimated:(BOOL)isShow;

@end
