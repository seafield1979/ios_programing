//
//  ViewController1.m
//  objective_c_test1
//
//  Created by 海野 秀祐 on 2013/08/03.
//  Copyright (c) 2013年 海野 秀祐. All rights reserved.
//

#import "ViewController1.h"
#import "oc_test1.h"
#import "oc_test2.h"

@interface ViewController1 ()

@end

@implementation ViewController1

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
		[test2 release];
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

- (void)dealloc {
    [_button1 release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setButton1:nil];
    [super viewDidUnload];
}
- (IBAction)push_button1:(id)sender {
}
@end
