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
 ViewController
   UIViewの生成、アニメーション、表示プライオリティ、
 ViewController2
   プログレスバー、アクションシート
 ViewController3
   
 ViewController4
 ViewControllerAd
 ViewControllerNib
 ViewControllerTimer
 ViewControllerLifeCycle
 */


#import "AppDelegate.h"
#import "ViewController.h"
#import "ViewController2.h"
#import "ViewController4.h"
#import "ViewControllerAd.h"
#import "ViewControllerPRTween.h"
#import "ViewControllerNib.h"
#import "ViewControllerTimer.h"
#import "ViewControllerLifeCycle.h"
#import "ViewControllerAffine.h"

typedef NS_ENUM(NSInteger, UNViewTestMode){
    UNViewTestMode1,
    UNViewTestMode2,
    UNViewTestMode4,
    UNViewTestModeAd,
    UNViewTestModeTween,
    UNViewTestModeNib,
    UNViewTestModeTimer,
    UNViewTestModeLifeCycle,
    UNViewTestModeAffine
};

@interface AppDelegate()

@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic) ViewController2 *viewController2;
@property (strong, nonatomic) ViewController4 *viewController4;
@property (strong, nonatomic) ViewControllerAd *viewControllerAd;
@property (strong, nonatomic) ViewControllerNib *viewControllerNib;
@property (strong, nonatomic) ViewControllerPRTween *viewControllerTween;
@property (strong, nonatomic) ViewControllerTimer *viewControllerTimer;
@property (strong, nonatomic) ViewControllerLifeCycle *viewControllerLifeCycle;
@property (strong, nonatomic) ViewControllerAffine *viewControllerAffine;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
	// ここから
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UNViewTestMode mode = UNViewTestModeAffine;

    switch(mode){
        case UNViewTestMode1:
            self.viewController = [[ViewController alloc] init];
            self.window.rootViewController = self.viewController;
            break;
        case UNViewTestMode2:
            self.viewController2 = [[ViewController2 alloc] init];
            self.window.rootViewController = self.viewController2;
            break;
        case UNViewTestModeAffine:
            self.viewControllerAffine = [[ViewControllerAffine alloc] init];
            self.window.rootViewController = self.viewControllerAffine;
            break;
        case UNViewTestMode4:
            self.viewController4 = [[ViewController4 alloc] init];
            self.window.rootViewController = self.viewController4;
            break;
        case UNViewTestModeAd:
            self.viewControllerAd = [[ViewControllerAd alloc] init];
            self.window.rootViewController = self.viewControllerAd;
            break;
        case UNViewTestModeNib:
            self.viewControllerNib = [[ViewControllerNib alloc] init];
            self.window.rootViewController = self.viewControllerNib;
            break;
        case UNViewTestModeTween:
            self.viewControllerTween = [[ViewControllerPRTween alloc] init];
            self.window.rootViewController = self.viewControllerTween;
            break;
        case UNViewTestModeTimer:
            self.viewControllerTimer = [[ViewControllerTimer alloc] init];
            self.window.rootViewController = self.viewControllerTimer;
            break;
        case UNViewTestModeLifeCycle:
            self.viewControllerLifeCycle = [[ViewControllerLifeCycle alloc] init];
            self.window.rootViewController = self.viewControllerLifeCycle;
            break;
    
    }
    [self.window makeKeyAndVisible];
    // ここまでを追加
    return YES;
}

@end
