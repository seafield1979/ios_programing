//
//  ViewController.m
//  objc1
//
//  Created by B02681 on 13/09/02.
//  Copyright (c) 2013年 B02681. All rights reserved.
//

#import "ViewController.h"
#import "UserDefaultTest.h"

@interface ViewController ()
{
	UserDefaultTest *_udt;
}
@end

@implementation ViewController

- (id)init{
	self = [super init];
	_udt = [[UserDefaultTest alloc]init];
	return self;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		_udt = [[UserDefaultTest alloc]init];
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
	[_udt setDefault];
}

- (IBAction)pushButton2:(id)sender {
	[_udt save1];
}

- (IBAction)pushButton3:(id)sender {
	[_udt load1];
}

- (IBAction)pushButton4:(id)sender {
	[self->_udt delete1];
}
@end
