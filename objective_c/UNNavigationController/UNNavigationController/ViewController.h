//
//  ViewController.h
//  UNNavigationController
//
//  Created by UnnoShusuke on 2014/08/24.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) UIButton *logoButton;
@property (weak, nonatomic) IBOutlet UILabel *label1;

- (IBAction)pushPopButton:(id)sender;
- (IBAction)pushPushButton:(id)sender;



@end
