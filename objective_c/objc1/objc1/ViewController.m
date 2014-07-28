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


@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
	
	// oc_test1
	if (true)
	{
		oc_test1 *test1 = [[oc_test1 alloc]init];
		[test1 test01];

	}
	// oc_test2
	if (true)
	{
		oc_test2 *test2 = [[oc_test2 alloc]init];
		[test2 test01];
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

@end
