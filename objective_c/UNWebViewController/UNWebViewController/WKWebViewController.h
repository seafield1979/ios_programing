//
//  WKWebViewController.h
//  UNWebViewController
//
//  Created by B02681 on 2015/08/04.
//  Copyright (c) 2015年 B02681. All rights reserved.
//

#import <UIKit/UIKit.h>
@import WebKit;

@interface WKWebViewController : UIViewController <WKNavigationDelegate, WKUIDelegate>

@property (nonatomic) WKWebView *webView;

@end
