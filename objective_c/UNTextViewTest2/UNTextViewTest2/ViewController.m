//
//  ViewController.m
//  UNTextViewTest2
//
//  Created by UnnoShusuke on 2014/12/18.
//  Copyright (c) 2014年 UnnoShusuke. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *contentView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initScrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private method
/**
 * スクロールビューを初期化
 * 4ページ分のコンテンツをスクロールする
 */
-(void)initScrollView
{
//    self.scrollView = [[UIScrollView alloc]initWithFrame: CGRectMake(0, 0, 320, 480)];
    self.scrollView.contentSize = CGSizeMake(320, 1000);
    self.scrollView.delegate = self;
//    
//    // viewにScrollViewを追加
//    [self.view addSubview:self.scrollView];
//    
//    // ScrollViewに表示するViewを生成
//    self.contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 1000)];
//    self.contentView.backgroundColor = [UIColor redColor];
//    
//    // ScrollViewにviewを追加
//    [self.scrollView addSubview:self.contentView];
    
    
}





@end
