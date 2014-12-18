//
//  AppDelegate.m
//  UNWebViewController
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
    self.viewController = [[UNWebViewController alloc] init];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    [self initBasicAuthentication];
    
    return YES;
}
							
- (void)initBasicAuthentication
{
    // 大喜利用
    NSString *url = @"http://stg.yomyo.jp/";
    NSURLCredentialStorage *storage = [NSURLCredentialStorage sharedCredentialStorage];
    NSURLCredential *credential = [NSURLCredential credentialWithUser:@"[Basic認証のID]"
                                                             password:@"[Basic認証のパスワード]"
                                                          persistence:NSURLCredentialPersistenceForSession];
    NSURLProtectionSpace *protectionSpace = [[NSURLProtectionSpace alloc] initWithHost:[[NSURL URLWithString:url] host]
                                                                                  port:80
                                                                              protocol:@"http"
                                                                                 realm:@"Restricted Files"
                                                                  authenticationMethod:NSURLAuthenticationMethodHTTPBasic];
    [storage setDefaultCredential:credential
               forProtectionSpace:protectionSpace];
}



@end
