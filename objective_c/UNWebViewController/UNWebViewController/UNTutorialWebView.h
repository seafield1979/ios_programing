//
//  UNTutorialWebView.h
//  UNWebViewController
//
//  Created by B02681 on 2015/02/13.
//  Copyright (c) 2015年 B02681. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UNTutorialWebView : UIWebView

- (void)loadPage:(NSInteger)page;
- (void)clearPage:(NSInteger)page;

@end
