//
//  WKWebViewController.m
//  UNWebViewController
//
//  Created by B02681 on 2015/08/04.
//  Copyright (c) 2015年 B02681. All rights reserved.
//

#import "WKWebViewController.h"

//#define TOP_PAGE_URL  @"http://www.nintendo.co.jp"
#define TOP_PAGE_URL     @"http://dev-branch03.astrum.amsg2.com:8000/"
#define AUTH_USER        @"staging"
#define AUTH_PWD         @"z1w6arMC"

@interface WKWebViewController ()

@end

@implementation WKWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // WKWebViewを生成する
    CGSize size = [UIScreen mainScreen].bounds.size;
    self.webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    
    
    // 画面に表示する
    [self.view addSubview:self.webView];

    // フリップでの戻る・進むを有効にする
    self.webView.allowsBackForwardNavigationGestures = YES;
    
    // Delegateを設定する
    self.webView.navigationDelegate = self;
    self.webView.UIDelegate = self;

    // ページをロードする
    if (self.webView) {
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:TOP_PAGE_URL]]];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark  - WKNavigationDelegate

// Decides whether to allow or cancel a navigation.
// 【 UIWebViewDelegate の - webView:shouldStartLoadWithRequest:navigationType: に相当 】
- (void)                    webView:(WKWebView *)webView
    decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction
                    decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    NSURL *nsurl = navigationAction.request.URL;
    NSString *url = nsurl.absoluteString;
    
    NSLog(@"WKWebViewController -webView:decidePolicyForNavigationAction:decisionHandler: called with url='%@'", url);
    
    decisionHandler(WKNavigationActionPolicyAllow);
}


/**
 * 認証が発生したときに呼ばれるDelegate。認証を行う場合はYESを返す
 */
- (BOOL)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace
{
    if([protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust])
    {
        return YES;
    }
    else
    {
        if([protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodHTTPBasic])
        {
            return YES;
        }
    }
    return NO;
}

/**
 * Basic認証のかかったページを表示しようとしたときに実行されるDelegate
 */
- (void)                      webView:(WKWebView *)webView
    didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
                    completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential *credential))completionHandler
{
    NSURLCredential *credential = [[NSURLCredential alloc] initWithUser:AUTH_USER
                                                               password:AUTH_PWD
                                                            persistence:NSURLCredentialPersistenceForSession];
    
    completionHandler(NSURLSessionAuthChallengeUseCredential, credential);
}



#pragma mark  - WKUIDelegate


@end
