//
//  ViewController2.m
//  ViewControllerTest
//
//  Created by B02681 on 2014/08/07.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
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


-(IBAction)pushCloseButton:(id)sender
{
	NSLog(@"pushCloseButton");
	[self.view removeFromSuperview];
}

@end
