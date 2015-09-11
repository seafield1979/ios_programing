//
//  UNWebViewController.m
//  UNWebViewController
//
//  Created by UnnoShusuke on 2014/08/23.
//  Copyright (c) 2014年 UnnoShusuke. All rights reserved.
//

#import "UNWebViewController.h"

#define kLoadURL   @"http://staging:z1w6arMC@dev-branch08.astrum.amsg2.com:8000/"

@interface UNWebViewController ()

@end

@implementation UNWebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//        [self initUserAgent];
//    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addWebView];
    [self addButton1];
    
    //[self setupUserAgent];
    
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

/*
 * ツールバーのアイテムをタップしたときの処理
 */
- (IBAction)barItemDidTap:(id)sender {
    UIBarItem *item = (UIBarItem*)sender;
    switch(item.tag) {
        case 1:
            [self.webView goBack];
            break;
        case 2:
            [self.webView goForward];
            break;
        case 3:
            [self.webView reload];
            break;
    }
}

#pragma mark - Action method
- (void)button1DidTap:(id)sender
{
    [self.webView removeFromSuperview];
    [self addWebView];
    
    [self.button1 removeFromSuperview];
    [self addButton1];
}



#pragma mark - Private method

- (void)addWebView
{
    // webView
    self.webView = [[UIWebView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Webページの大きさを自動的に画面にフィットさせる
    _webView.scalesPageToFit = YES;
    [self.view addSubview:self.webView];
    // ページをロードする
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:kLoadURL]]];
    _webView.delegate = self;
}

- (void)addButton1
{
    // ボタン
    self.button1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 50, 100, 40)];
    [self.button1.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [self.view addSubview:self.button1];
    
    [self.button1 setTitle:@"refresh" forState:UIControlStateNormal];
    [self.button1 addTarget:self action:@selector(button1DidTap:) forControlEvents:UIControlEventTouchUpInside];
}

/**
 * プリコネのUAを設定
 */
- (void)setupUserAgent
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //デフォルトのUserAgentを取得するために、サイズゼロのUIWebViewのインスタンスを生成
        UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectZero];
        
        //デフォルトのUserAgentを取得
        NSString *userAgent = [webView stringByEvaluatingJavaScriptFromString:@"navigator.userAgent"];
        
        //デフォルトのUserAgentに独自の文字列を追加
        NSString *customUserAgent = [userAgent stringByAppendingString:@" CaBaseApp/1.0(jp.co.cyberagent.paris;1.1.1;ja) CaWebApp/1.0(jp.co.cyberagent.paris;1.1.1;ja)"];
        
        //UserAgent再設定
        NSDictionary *dictionary = @{@"UserAgent":customUserAgent};
        [[NSUserDefaults standardUserDefaults] registerDefaults:dictionary];
    });
}


@end
