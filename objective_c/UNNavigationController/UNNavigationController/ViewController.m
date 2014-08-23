//
//  ViewController.m
//  UNNavigationController
//
//  Created by UnnoShusuke on 2014/08/24.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // タイトル
    self.navigationItem.title = @"111";
    
#if 1
    UIBarButtonItem *backButton = [UIBarButtonItem new];
    backButton.title = @"戻る";
    self.navigationItem.backBarButtonItem = backButton;
#endif

    // 左ボタン
#if 0
    UIBarButtonItem *leftButton = [UIBarButtonItem new];
    leftButton.title = @"左";
    self.navigationItem.leftBarButtonItem = leftButton;
#endif
    
    // 右ボタン
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"右" style:UIBarButtonItemStylePlain target:self action:@selector(pushRightButton:)];
    self.navigationItem.rightBarButtonItem = rightButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushPushButton:(id)sender {
    //新しいViewControllerを作成してPushする
    ViewController *vc = [[ViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)pushPopButton:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}



#pragma mark - Private method
-(void)pushRightButton:(id)selector
{
    NSLog(@"pushRightButton");
}
@end
