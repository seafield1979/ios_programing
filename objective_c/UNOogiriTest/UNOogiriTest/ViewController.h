//
//  ViewController.h
//  UNOogiriTest
//
//  Created by B02681 on 2014/09/30.
//  Copyright (c) 2014年 B02681. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UNTabScrollView.h"
#import "UNMenuViewController.h"

@interface ViewController : UIViewController


@property (nonatomic, weak) IBOutlet UIView *baseView;
@property (nonatomic, weak) IBOutlet UIView *tabBaseView;
@property (nonatomic, weak) IBOutlet UIView *pagingBaseView;
@property (nonatomic, weak) IBOutlet UIButton *menuButton;
@property (nonatomic, strong) UNMenuViewController *menuViewController;

@property (nonatomic, strong) UNTabScrollView *tabView;
- (IBAction)tableViewButtonDidTap:(id)sender;

@end

