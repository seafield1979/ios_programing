//
//  AppDelegate.m
//  ViewTest
//
//  Created by 海野 秀祐 on 2014/08/04.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//
/**
 シングルのビューでできることをいろいろと試す
 ツールバーやナビゲーションバーに配置するボタンを管理する
 */


#import "AppDelegate.h"
#import "ViewController.h"
#import "ViewController2.h"
#import "ViewController3.h"
#import "ViewController4.h"
#import "ViewControllerAd.h"
#import "ViewControllerPRTween.h"
#import "ViewControllerNib.h"
#import "ViewControllerTimer.h"


@interface AppDelegate()

@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic) ViewController2 *viewController2;
@property (strong, nonatomic) ViewController3 *viewController3;
@property (strong, nonatomic) ViewController4 *viewController4;
@property (strong, nonatomic) ViewControllerAd *viewControllerAd;
@property (strong, nonatomic) ViewControllerNib *viewControllerNib;
@property (strong, nonatomic) ViewControllerPRTween *viewControllerTween;
@property (strong, nonatomic) ViewControllerTimer *viewControllerTimer;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
	// ここから
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    int mode = 6;

    switch(mode){
        case 1:
            self.viewController = [[ViewController alloc] init];
            self.window.rootViewController = self.viewController;
            break;
        case 2:
            self.viewController2 = [[ViewController2 alloc] init];
            self.window.rootViewController = self.viewController2;
            break;
        case 3:
            self.viewController3 = [[ViewController3 alloc] init];
            self.window.rootViewController = self.viewController3;
            break;
        case 4:
            self.viewController4 = [[ViewController4 alloc] init];
            self.window.rootViewController = self.viewController4;
            break;
        case 5:
            self.viewControllerAd = [[ViewControllerAd alloc] init];
            self.window.rootViewController = self.viewControllerAd;
            break;
        case 6:
            self.viewControllerNib = [[ViewControllerNib alloc] init];
            self.window.rootViewController = self.viewControllerNib;
            break;
        case 7:
            self.viewControllerTween = [[ViewControllerPRTween alloc] init];
            self.window.rootViewController = self.viewControllerTween;
            break;
        case 8:
            self.viewControllerTimer = [[ViewControllerTimer alloc] init];
            self.window.rootViewController = self.viewControllerTimer;
            break;
        case 9:
            self.viewControllerTimer = [[ViewControllerTimer alloc] init];
            self.window.rootViewController = self.viewControllerTimer;
            break;
    
    }
    [self.window makeKeyAndVisible];
    // ここまでを追加
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
