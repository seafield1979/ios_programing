//
//  AppDelegate.m
//  ViewControllerTest
//
//  Created by 海野 秀祐 on 2014/08/04.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import "AppDelegate.h"

#define NAVIGATION		(false)		// ナビゲーションコントローラを使用するか(true/false)
#define VC_MODE            (0)

@interface AppDelegate ()
{
#if NAVIGATION
	UINavigationController *_nav;
#endif
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
#if VC_MODE == 0
    self.viewController1 = [[UNViewController1 alloc]initWithNibName:@"UNViewController1" bundle: nil];
    self.window.rootViewController = self.viewController1;
#elif VC_MODE == 1
	self.tableViewController2 = [[TableViewController2 alloc]init];
    self.window.rootViewController = self.tableViewController2;
    
    // ナビゲーションコントローラにベースとなるコントローラをセット
    self.tableViewController2 = [[TableViewController2 alloc]init];
    _navigationController = [[UINavigationController alloc] initWithRootViewController:_tableViewController2];
    
    // ナビゲーションコントローラのビューをウィンドウに貼付ける
    self.window.rootViewController = self.tableViewController3;

#elif VC_MODE == 2
    // ナビゲーションコントローラにベースとなるコントローラをセット
    self.tableViewController3 = [[TableViewController3 alloc]init];
    // ナビゲーションコントローラのビューをウィンドウに貼付ける
    self.window.rootViewController = self.tableViewController3;
#endif
    
    [self.window makeKeyAndVisible];
		
    return YES;
}

@end
