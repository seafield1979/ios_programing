//
//  ViewController.m
//  ScrollViewTest
//
//  Created by B02681 on 2014/08/06.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//
/*
 縦にスクロール
 ページングなし
 */

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *contentView;

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	
	[self initScrollView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark _PrivateFunctions


/**
 * スクロールビューを初期化
 * 4ページ分のコンテンツをスクロールする
 */
-(void)initScrollView
{
    self.scrollView = [[UIScrollView alloc]initWithFrame: CGRectMake(0, 0, 320, 480)];
    self.scrollView.contentSize = CGSizeMake(320, 1000);
    self.scrollView.delegate = self;
    
    // viewにScrollViewを追加
    [self.view addSubview:self.scrollView];
    
    // ScrollViewに表示するViewを生成
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 500)];
    view1.backgroundColor = [UIColor redColor];
    [self.scrollView addSubview:view1];
    
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(0, 500, 320, 500)];
    view2.backgroundColor = [UIColor greenColor];
    [self.scrollView addSubview:view2];

}

#pragma mark _UIScrollViewDelegate

// スクロール時の処理
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
	int offset_x = (int)scrollView.contentOffset.x;
	NSLog(@"%d", offset_x);
	_label1.text = [NSString stringWithFormat:@"offset_x:%d", offset_x];
	
}


#pragma mark _Action

@end

