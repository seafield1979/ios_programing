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
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
#if 1
    self.wkWebViewController = [[WKWebViewController alloc] initWithNibName:@"WKWebViewController" bundle:[NSBundle mainBundle]];
    self.window.rootViewController = self.wkWebViewController;
    
#else
    self.viewController = [[UNWebViewController alloc] init];
    self.window.rootViewController = self.viewController;
#endif
    //[self setUserAgent];
    [self.window makeKeyAndVisible];
    
    [self initBasicAuthentication];
    
    return YES;
}
							
- (void)initBasicAuthentication
{
    NSString *url = @"[ページのURL]";
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

/**
 * User Agent設定
 */
- (void)setUserAgent
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud registerDefaults:@{ @"UserAgent" : @"Mozilla/5.0 (iPhone; CPU iPhone OS 8_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12B411 CaBaseApp/1.0(jp.co.cyberagent.paris;1.1.1;ja) CaWebApp/1.0(jp.co.cyberagent.paris;2.0.0;ja)" }];
    [ud synchronize];
}



@end
