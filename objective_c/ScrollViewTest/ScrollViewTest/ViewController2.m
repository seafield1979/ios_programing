//
//  ViewController2.m
//  ScrollViewTest
//
//  Created by B02681 on 2014/08/06.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//
/*
	縦にスクロールする
 */

#import "ViewController2.h"

@interface ViewController2 ()
{
	UIScrollView *_scrollView;
}
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
	
	// Custom initialization
	CGRect scrollViewRect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 100);
	_scrollView = [[UIScrollView alloc]initWithFrame:scrollViewRect];
	_scrollView.pagingEnabled = YES;
	[self.view addSubview:_scrollView];
	
	
	// UIScrollViewに表示するコンテンツViewを作成する。
	CGSize s = _scrollView.frame.size;
	CGRect contentRect = CGRectMake(0, 0, s.width, s.height * 4);
	UIView *contentView = [[UIView alloc] initWithFrame:contentRect];
	// コンテンツViewに表示する緑色Viewを追加する。
	UIView *subContent1View = [[UIView alloc] initWithFrame:CGRectMake(0, s.height * 0, s.width, s.height)];
	subContent1View.backgroundColor = [UIColor greenColor];
	[contentView addSubview:subContent1View];
	// コンテンツViewに表示する青色Viewを追加する。
	UIView *subContent2View = [[UIView alloc] initWithFrame:CGRectMake(0, s.height * 1, s.width, s.height)];
	subContent2View.backgroundColor = [UIColor blueColor];
	[contentView addSubview:subContent2View];
	// コンテンツViewに表示する赤色Viewを追加する。
	UIView *subContent3View = [[UIView alloc] initWithFrame:CGRectMake(0, s.height * 2, s.width, s.height)];
	subContent3View.backgroundColor = [UIColor redColor];
	[contentView addSubview:subContent3View];
	// コンテンツViewに表示する黄色Viewを追加する。
	UIView *subContent4View = [[UIView alloc] initWithFrame:CGRectMake(0, s.height * 3, s.width, s.height)];
	subContent4View.backgroundColor = [UIColor yellowColor];
	[contentView addSubview:subContent4View];
	// スクロールViewにコンテンツViewを追加する。
	[_scrollView addSubview:contentView];
	
	// スクロールView上のコンテンツViewのサイズを指定します。
	_scrollView.contentSize = contentView.frame.size;
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
