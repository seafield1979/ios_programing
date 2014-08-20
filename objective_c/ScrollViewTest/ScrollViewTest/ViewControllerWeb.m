//
//  ViewControllerWeb.m
//  ScrollViewTest
//
//  Created by B02681 on 2014/08/20.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import "ViewControllerWeb.h"

@interface ViewControllerWeb ()
{
    NSMutableArray *webViewList;
}
@end

@implementation ViewControllerWeb

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		pageNum = 1;
		pageMax = 4;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	[self initScrollView];
    
    
    //statusbarが重ならないようにviewを少し下に移動
    //_view1.frame = CGRectMake(0, 20, _view1.frame.size.width, _view1.frame.size.height - 20);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
	
}

/**
 * スクロールビューを初期化
 * 4ページ分のコンテンツをスクロールする
 */
-(void)initScrollView
{
	// Custom initialization
	CGRect scrollViewRect = CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 200);
	_scrollView = [[UIScrollView alloc]initWithFrame:scrollViewRect];
	_scrollView.pagingEnabled = YES;
	[self.view addSubview:_scrollView];
	
	// UIScrollViewに表示するコンテンツViewを作成する。
	CGSize s = _scrollView.frame.size;
	CGRect contentRect = CGRectMake(0, 0, s.width * pageMax, s.height);
	UIView *contentView = [[UIView alloc] initWithFrame:contentRect];

    // スクロールビューに表示するWebViewを初期化
    webViewList = [[NSMutableArray alloc]init];
    
    for(int i=0; i<4; i++){
        UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(i * self.view.frame.size.width, 0, s.width, s.height)];
        [webViewList addObject: webView];
        [contentView addSubview: webView];
        [webView loadRequest:
                              [NSURLRequest requestWithURL:
                               [NSURL URLWithString:@"http://ameba-oogiri.jp"]
                              ]
         ];
    }
    
	// スクロールViewにコンテンツViewを追加する。
	[_scrollView addSubview:contentView];
	
	// スクロールView上のコンテンツViewのサイズを指定します。
	_scrollView.contentSize = contentView.frame.size;
	
	_scrollView.delegate = self;
	
	// 初期表示するコンテンツViewの場所を指定します。
	// 今回は２ページ目から表示します。
	_scrollView.contentOffset = CGPointMake(320, 0);
	
	
}


#pragma mark _UIScrollViewDelegate

// スクロール時の処理
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
	int offset_x = (int)scrollView.contentOffset.x;
    //	NSLog(@"%d", offset_x);
    //	_label1.text = [NSString stringWithFormat:@"offset_x:%d", offset_x];
	pageNum = (int)(offset_x / 320);
    //	_label2.text = [NSString stringWithFormat:@"page:%d", pageNum + 1];
	
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewWillBeginDragging");
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset NS_AVAILABLE_IOS(5_0)
{
    NSLog(@"scrollViewWillEndDragging");
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"scrollViewDidEndDragging");
}
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewWillBeginDecelerating");
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidEndDecelerating");
}


@end
