//
//  ViewController.m
//  UNPullToRefresh
//
//  Created by UnnoShusuke on 2014/08/23.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    
    [self.webView1 loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://ameba-oogiri.jp/sp/mypage/nonmember"]]];
    
    self.webView1.delegate = self;
    self.webView1.scrollView.delegate = self;
    self.webView1.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

    [self.webView1.scrollView addSubview:self.refreshView];
    
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    //LOG(@"DidStart:%@",webView.request.URL.absoluteString);
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    //LOG(@"DidFinish:%@",webView.request.URL.absoluteString);
    
    if (self.webViewLoadComplition) {
        self.webViewLoadComplition(YES);
        self.webViewLoadComplition = nil;
    }
//	//スクロール速度を高速化
//	self.webView.scrollView.decelerationRate = UIScrollViewDecelerationRateNormal;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    //LOG(@"DidFail:%@ Error:%@",webView.request.URL.absoluteString,error);
    
    if (self.webViewLoadComplition) {
        self.webViewLoadComplition(NO);
        self.webViewLoadComplition = nil;
    }
}


#pragma mark - RefreshWebHeaderDelegate
- (void)pullRefreshHeaderDidTriggerRefresh:(RefreshWebHeaderView *)view
{
    if (!self.webView1.loading) {
        [self.webView1 reload];
        
        // 完了ハンドラの設定
        RefreshWebHeaderView *refreshView = self.refreshView;
        UIScrollView *scrollView = self.webView1.scrollView;
        
        __block ViewController *blockself = self;
        self.webViewLoadComplition = ^(BOOL success) {
            [refreshView pullRefreshScrollViewDataSourceDidFinishedLoading:scrollView];
            
            blockself.webView1.scrollView.contentSize = CGSizeMake(blockself.webView1.scrollView.contentSize.width,
                                                              blockself.webView1.scrollView.contentSize.height + 32);
        };
    }
}

- (BOOL)pullRefreshHeaderDataSourceIsLoading:(RefreshWebHeaderView *)view
{
    return self.webView1.loading;
}


#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // プルトゥリフレッシュ用の処理
    [self.refreshView pullRefreshScrollViewDidScroll:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    // プルトゥリフレッシュ用の処理
    [self.refreshView pullRefreshScrollViewDidEndDragging:scrollView];
}


#pragma mark - Public Method

- (RefreshWebHeaderView *)refreshView
{
    if (!_refreshView) {
        _refreshView = [[RefreshWebHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - self.view.bounds.size.height, self.view.frame.size.width, self.view.bounds.size.height)];
        _refreshView.delegate = self;
    }
    return _refreshView;
}


@end
