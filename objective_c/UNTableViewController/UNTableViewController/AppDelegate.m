//
//  AppDelegate.m
//  UNTableViewController
//
//  Created by B02681 on 2014/10/07.
//  Copyright (c) 2014年 B02681. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *    )application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    switch(3){
        case 1:
            self.tableViewController = [[TableViewController alloc]init];
            self.window.rootViewController = self.tableViewController;
            break;
        case 2:
            self.tableViewController2 = [[TableViewController2 alloc]init];
            self.window.rootViewController = self.tableViewController2;
            
            // ナビゲーションコントローラにベースとなるコントローラをセット
            self.tableViewController2 = [[TableViewController2 alloc]init];
            _navigationController = [[UINavigationController alloc] initWithRootViewController:_tableViewController2];
            break;
        case 3:
            // ナビゲーションコントローラにベースとなるコントローラをセット
            self.tableViewController3 = [[TableViewController3 alloc]init];
            self.window.rootViewController = self.tableViewController3;
            break;
    }
    
    [self.window makeKeyAndVisible];
    
    return YES;

}


@end
