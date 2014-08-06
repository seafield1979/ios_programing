//
//  ViewController.m
//  ScrollViewTest
//
//  Created by B02681 on 2014/08/06.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
	UIScrollView *_scrollView;
	int pageNum;
	int pageMax;
}
@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		pageNum = 1;
		pageMax = 4;
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
	CGRect contentRect = CGRectMake(0, 0, s.width * pageMax, s.height);
	UIView *contentView = [[UIView alloc] initWithFrame:contentRect];
	// コンテンツViewに表示する緑色Viewを追加する。
	UIView *subContent1View = [[UIView alloc] initWithFrame:CGRectMake(320 * 0, 0, s.width, s.height)];
	subContent1View.backgroundColor = [UIColor greenColor];
	[contentView addSubview:subContent1View];
	// コンテンツViewに表示する青色Viewを追加する。
	UIView *subContent2View = [[UIView alloc] initWithFrame:CGRectMake(320 * 1, 0, s.width, s.height)];
	subContent2View.backgroundColor = [UIColor blueColor];
	[contentView addSubview:subContent2View];
	// コンテンツViewに表示する赤色Viewを追加する。
	UIView *subContent3View = [[UIView alloc] initWithFrame:CGRectMake(320 * 3, 0, s.width, s.height)];
	subContent3View.backgroundColor = [UIColor redColor];
	[contentView addSubview:subContent3View];
	// コンテンツViewに表示する黄色Viewを追加する。
	UIView *subContent4View = [[UIView alloc] initWithFrame:CGRectMake(320 * 4, 0, s.width, s.height)];
	subContent4View.backgroundColor = [UIColor yellowColor];
	[contentView addSubview:subContent4View];
	// スクロールViewにコンテンツViewを追加する。
	[_scrollView addSubview:contentView];
	
	// スクロールView上のコンテンツViewのサイズを指定します。
#if 1
	_scrollView.contentSize = contentView.frame.size;
#else
	_scrollView.contentSize = CGSizeMake(4000, 1000);
#endif
	
	_scrollView.delegate = self;
	
	
	// 初期表示するコンテンツViewの場所を指定します。
	// 今回は２ページ目から表示します。
	_scrollView.contentOffset = CGPointMake(320, 0);
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark _UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
	int offset_x = (int)scrollView.contentOffset.x;
	NSLog(@"%d", offset_x);
	_label1.text = [NSString stringWithFormat:@"offset_x:%d", offset_x];
	pageNum = (int)(offset_x / 320);
	_label2.text = [NSString stringWithFormat:@"page:%d", pageNum + 1];
}


#pragma mark _Action
// 前のページに戻る
-(IBAction)pushPrevButton:(id)sender
{
	NSLog(@"pushPrevButton");
	int offset_x = (int)_scrollView.contentOffset.x;
	pageNum = (int)(offset_x / 320);
	if(pageNum > 0){
		[UIView animateWithDuration:0.7f
			 animations:^{
				 // アニメーションをする処理
				 _scrollView.contentOffset = CGPointMake((pageNum - 1) * 320, 0);
			 }];
	}
}

// 次のページに進む
-(IBAction)pushNextButton:(id)sender
{
	NSLog(@"pushNextButton");
	int offset_x = (int)_scrollView.contentOffset.x;
	pageNum = (int)(offset_x / 320);
	if(pageNum < pageMax - 1){
		[UIView animateWithDuration:0.7f
			 animations:^{
				 // アニメーションをする処理
				 _scrollView.contentOffset = CGPointMake((pageNum + 1) * 320, 0);
			 }];
	}
}

@end

