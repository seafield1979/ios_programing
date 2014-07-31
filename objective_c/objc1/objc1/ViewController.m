//
//  ViewController.m
//  objc1
//
//  Created by B02681 on 13/09/02.
//  Copyright (c) 2013年 B02681. All rights reserved.
//

#import "ViewController.h"
#import "oc_test1.h"
#import "oc_test2.h"
#import "UserDefaultTest.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)init{
	self = [super init];
	return self;
}
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
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark ButtonFunc


- (IBAction)pushButton1:(id)sender {
//	UserDefaultTest *udt = [[UserDefaultTest alloc]init];
//	[udt save1];
}

- (IBAction)pushButton2:(id)sender {
	UserDefaultTest *udt = [[UserDefaultTest alloc]init];
	[udt load1];
}

- (IBAction)pushButton3:(id)sender {
}

- (IBAction)pushButton4:(id)sender {
}
@end
