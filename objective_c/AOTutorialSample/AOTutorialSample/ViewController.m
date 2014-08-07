//
//  ViewController.m
//  AOTutorialSample
//
//  Created by B02681 on 2014/08/07.
//  Copyright (c) 2014年 B02681. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushButton1:(id)sender {
	NSLog(@"pushButton1");
	
	UIAlertView *alert =
	[[UIAlertView alloc]
	 initWithTitle:@"ViewController"
	 message:@"pushButton1"
	 delegate:nil
	 cancelButtonTitle:@"NG"
	 otherButtonTitles:@"OK", nil
	 ];
	alert.delegate = self;
	[alert show];
}

// アラートのボタンが押された時に呼ばれるデリゲート例文
-(void)alertView:(UIAlertView*)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex {
	
	switch (buttonIndex) {
		case 0:
			//１番目のボタンが押されたときの処理を記述する
			NSLog(@"Cancel button");
			break;
		case 1:
			//２番目のボタンが押されたときの処理を記述する
			NSLog(@"OK button");
			break;
	}
	
}

@end
