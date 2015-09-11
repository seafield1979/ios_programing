//
//  UNWebViewController.h
//  UNWebViewController
//
//  Created by UnnoShusuke on 2014/08/23.
//  Copyright (c) 2014年 UnnoShusuke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UNWebViewController : UIViewController <UIWebViewDelegate>
@property (strong, nonatomic) UIWebView *webView;
@property (strong, nonatomic) UIButton *button1;
@end
