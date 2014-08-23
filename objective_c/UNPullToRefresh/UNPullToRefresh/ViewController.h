//
//  ViewController.h
//  UNPullToRefresh
//
//  Created by UnnoShusuke on 2014/08/23.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RefreshWebHeaderView.h"

/**
 * BOOLフラグ引数付きブロック
 * @param flag
 */
typedef void(^BlockWithFlag)(BOOL flag);

@interface ViewController : UIViewController <UIWebViewDelegate, UIScrollViewDelegate, RefreshWebHeaderDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView1;



@property (strong, nonatomic) RefreshWebHeaderView *refreshView;

// Webページ読み込み完了後に実行する
@property (strong ,nonatomic) BlockWithFlag webViewLoadComplition;

- (RefreshWebHeaderView *)refreshView;

@end
