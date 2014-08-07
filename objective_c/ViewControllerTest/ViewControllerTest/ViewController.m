//
//  ViewController.m
//  ViewControllerTest
//
//  Created by 海野 秀祐 on 2014/08/06.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
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
	
	// ナビゲーションバーの設定
	self.navigationItem.title = @"hello";
	// システムのボタン
	UIBarButtonItem *btn_l = [[UIBarButtonItem alloc]
							  initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
							  target:self action:@selector(hoge_l:)];
	self.navigationItem.leftBarButtonItem = btn_l;

	if(1){
	UIBarButtonItem *btn = [[UIBarButtonItem alloc]
							initWithBarButtonSystemItem:UIBarButtonSystemItemCamera
							target:self action:@selector(hoge_r:)];
	self.navigationItem.rightBarButtonItem = btn;

	}
	else{
	UIBarButtonItem *btn_r = [[UIBarButtonItem alloc]
							  initWithBarButtonSystemItem:UIBarButtonSystemItemDone
							  target:self action:@selector(hoge_r:)];
	self.navigationItem.rightBarButtonItem = btn_r;
	}

#if 0
	self.navigationController.navigationBar.tintColor = [UIColor redColor];
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 480, 44)];
	
//	label.backgroundColor = [UIColor clearColor];
	label.backgroundColor = [UIColor greenColor];
	label.numberOfLines = 1;
	label.font = [UIFont boldSystemFontOfSize: 14.0f];
	label.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
//	label.textAlignment = UITextAlignmentCenter;
	label.textColor = [UIColor whiteColor];
	label.text = @"タイトル宜しくサブタイトル";
	self.navigationItem.titleView = label;
#endif
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)hoge_l:(id)sender
{
	NSLog(@"push Navigation left button");
}

-(void)hoge_r:(id)sender
{
	NSLog(@"push Navigation right button");
}

@end
