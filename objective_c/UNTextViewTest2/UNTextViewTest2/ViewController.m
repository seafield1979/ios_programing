//
//  ViewController.m
//  UNTextViewTest2
//
//  Created by UnnoShusuke on 2014/12/18.
//  Copyright (c) 2014年 UnnoShusuke. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initScrollView];
}

#pragma mark - Private method
/**
 * スクロールビューを初期化
 * 4ページ分のコンテンツをスクロールする
 */
-(void)initScrollView
{
    self.scrollView.contentSize = CGSizeMake(320, 1000);
    self.scrollView.delegate = self;
}





@end
