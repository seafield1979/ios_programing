//
//  AppDelegate.m
//  ScrollViewTest
//
//  Created by 海野 秀祐 on 2014/08/04.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import "AppDelegate.h"

typedef NS_ENUM (NSInteger, ViewControllerMode) {
    VCMode1 = 0,
    VCMode2,
    VCMode3,
    VCMode4,
    VCModeAutolayout
};

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    
    // UserAgentを変更
    UIWebView *wv = [[UIWebView alloc] initWithFrame:CGRectZero];
    NSString *ua = [wv stringByEvaluatingJavaScriptFromString:@"navigator.userAgent"];
    NSString *currentVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    ua = [NSString stringWithFormat:@"%@ CaWebApp/1.0(ameba-oogiri;%@;ja;)", ua, currentVersion];
	
    [[NSUserDefaults standardUserDefaults] registerDefaults:@{@"UserAgent":ua}];
    
    
    switch (VCModeAutolayout) {
        case VCMode1:
            self.viewControllerWeb = [[ViewControllerWeb alloc] init];
            self.window.rootViewController = self.viewControllerWeb;
            break;
        case VCMode2:
            self.viewController = [[ViewController alloc] init];
            self.window.rootViewController = self.viewController;
            break;
        case VCMode3:
            self.viewController2 = [[ViewController2 alloc] init];
            self.window.rootViewController = self.viewController2;
            break;
        case VCMode4:
            self.viewController3 = [[ViewController3 alloc] init];
            self.window.rootViewController = self.viewController3;
            break;
        case VCModeAutolayout:
            self.viewControllerAutolayout = [ViewControllerAutolayout new];
            self.window.rootViewController = self.viewControllerAutolayout;
            break;
    }
    [self.window makeKeyAndVisible];
    return YES;
}

@end
