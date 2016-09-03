//
//  AppDelegate.m
//  UNNavigationController
//
//  Created by UnnoShusuke on 2014/08/24.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    
    // ナビゲーションコントローラにベースとなるコントローラをセット
    ViewController *topController = [[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
    _naviController = [[UNNavigationController alloc]
                       initWithRootViewController:topController];

    // ナビゲーションコントローラのビューをウィンドウに貼付ける
    self.window.rootViewController = _naviController;
    
    [self.window makeKeyAndVisible];
    

    return YES;
}

@end
