//
//  ViewController2.m
//  UNNavigationController
//
//  Created by UnnoShusuke on 2014/08/24.
//  Copyright (c) 2014年 UnnoShusuke. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

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
    
    UIView *centerView = [self centerBarItem];
    
//    UINavigationBar *navBar = [[self navigationController] navigationBar];
//    UIImage *backgroundImage = [UIImage imageNamed:@"navi_button1"];
//    [navBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];

//    [self.navigationController.view addSubview:centerView];
//    [self.view addSubview:centerView];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UIView *)centerBarItem
{
    // ルートのオブジェクトを返す
    if (!_logoButton) {
        _logoButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_logoButton setImage:[UIImage imageNamed:@"navi_button1"] forState:UIControlStateNormal];
        [_logoButton sizeToFit];
        [_logoButton addTarget:self action:@selector(logoButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _logoButton;
}

-(void)logoButtonDidTap:(id)sender
{
    NSLog(@"logoButtonDidTap");
}
@end
