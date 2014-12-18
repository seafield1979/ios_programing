//
//  UNWebViewController.m
//  UNWebViewController
//
//  Created by UnnoShusuke on 2014/08/23.
//  Copyright (c) 2014年 UnnoShusuke. All rights reserved.
//

#import "UNWebViewController.h"

#define kLoadURL   @"http://stg.yomyo.jp"

@interface UNWebViewController ()

@end

@implementation UNWebViewController

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
    
    // Webページの大きさを自動的に画面にフィットさせる
    _webView.scalesPageToFit = YES;
    // ページをロードする
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:kLoadURL]]];
    _webView.delegate = self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIWebViewDelegate

// ページのロードリクエスト
// @ret YES:ページを読み込む / NO:ページを読み込まない
 - (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"shouldStartLoadWithRequest %@", [[request URL]absoluteString]);
    return YES;
}

// ページ読み込み開始
- (void)webViewDidStartLoad:(UIWebView*)webView
{
    NSLog(@"webViewDidStartLoad");
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

//ページ読み込み完了
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"webViewDidFinishLoad");
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}
@end
