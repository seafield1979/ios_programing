//
//  ViewController3.h
//  ViewTest
//
//  Created by B02681 on 2014/08/08.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UNImageView.h"

@interface ViewController3 : UIViewController

@property (nonatomic, strong) IBOutlet UNImageView *imageView1;

-(IBAction)pushButton1:(id)sender;
-(IBAction)pushButton2:(id)sender;
-(IBAction)pushButton3:(id)sender;
-(IBAction)pushButton4:(id)sender;
- (IBAction)pushBlinkButton:(id)sender;
- (IBAction)pushMoveButton:(id)sender;

@end
