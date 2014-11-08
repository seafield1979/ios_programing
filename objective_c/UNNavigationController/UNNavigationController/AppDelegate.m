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
#if 1
    ViewController *topController = [[ViewController alloc]init];
    _naviController = [[UINavigationController alloc]
                       initWithRootViewController:topController];
#else
    ViewController2 *topController = [[ViewController2 alloc]init];
    _naviController = [[UNNavigationController alloc]
                       initWithRootViewController:topController];
#endif
    // ナビゲーションコントローラのビューをウィンドウに貼付ける
    [self.window addSubview:_naviController.view];
    
    [self.window makeKeyAndVisible];
    

    return YES;
}

@end
