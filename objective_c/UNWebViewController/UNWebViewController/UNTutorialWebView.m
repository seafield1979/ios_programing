//
//  UNTutorialWebView.m
//  UNWebViewController
//
//  Created by B02681 on 2015/02/13.
//  Copyright (c) 2015年 B02681. All rights reserved.
//
/*
    チュートリアルのhtmlを表示するWebView
 */

#import "UNTutorialWebView.h"

#define htmlNames @[@"tutorial1_nobg", @"tutorial2_nobg", @"tutorial3_nobg"]

@interface UNTutorialWebView()

@property (nonatomic) BOOL isAnimating;

@end

@implementation UNTutorialWebView

/*
 *
 */
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _isAnimating = NO;
        // WebViewの背景を透過
        [self setBackgroundColor:[UIColor clearColor]];
        [self setOpaque:NO];
    }
    return self;
}

/*
 * チュートリアルページをロードする
 */
- (void)loadPage:(NSInteger)page
{
    if (self.isAnimating) {
        return;
    }
    if (page > 2) {
        return;
    }
    
    NSLog(@"load %ld", page);
    self.isAnimating = YES;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:htmlNames[page] ofType:@"html"];
    NSFileHandle *readHandle = [NSFileHandle fileHandleForReadingAtPath:path];
    NSString *htmlString = [[NSString alloc] initWithData:[readHandle readDataToEndOfFile] encoding:NSUTF8StringEncoding];
    [self loadHTMLString:htmlString baseURL:[NSURL fileURLWithPath:path]];
}

/*
 * ページの表示をクリアする
 */
- (void)clearPage:(NSInteger)page
{
    if (!self.isAnimating) {
        return;
    }
    NSLog(@"unload %ld", page);
    self.isAnimating = NO;
    [self loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"about:blank"]]];
}

@end
