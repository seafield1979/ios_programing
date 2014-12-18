//
//  AppDelegate.m
//  UNPullToRefresh
//
//  Created by UnnoShusuke on 2014/08/23.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.viewController = [[ViewController alloc] init];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    [self initUserAgent];
    
    return YES;
}

/*
 ** UserAgentを設定
 *  アプリの識別文字列を追加 CaWebApp/1.0(ameba-oogiri;1.5.6;ja;)
 */
- (void)initUserAgent
{
    UIWebView *wv = [[UIWebView alloc] initWithFrame:CGRectZero];
    NSString *ua = [wv stringByEvaluatingJavaScriptFromString:@"navigator.userAgent"];
    NSString *currentVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    ua = [NSString stringWithFormat:@"%@ CaWebApp/1.0(ameba-oogiri;%@;ja;)", ua, currentVersion];
    //バージョンを整数で取得
    
    [[NSUserDefaults standardUserDefaults] registerDefaults:@{@"UserAgent":ua}];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
