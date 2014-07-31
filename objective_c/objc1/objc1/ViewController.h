//
//  ViewController.h
//  objc1
//
//  Created by B02681 on 13/09/02.
//  Copyright (c) 2013年 B02681. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *button1;
@property (strong, nonatomic) IBOutlet UIButton *button2;
@property (strong, nonatomic) IBOutlet UIButton *button3;
@property (strong, nonatomic) IBOutlet UIButton *button4;

- (IBAction)pushButton1:(id)sender;
- (IBAction)pushButton2:(id)sender;
- (IBAction)pushButton3:(id)sender;
- (IBAction)pushButton4:(id)sender;


@end
