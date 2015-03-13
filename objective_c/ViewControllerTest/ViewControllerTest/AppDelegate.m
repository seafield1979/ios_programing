//
//  AppDelegate.m
//  ViewControllerTest
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
    
    switch(4){
        case 1:
            {
                self.viewController1 = [[UNViewController1 alloc]initWithNibName:@"UNViewController1" bundle: nil];
                self.window.rootViewController = self.viewController1;
            }
            break;
        case 2:
            {
                self.tableViewController2 = [[TableViewController2 alloc]init];
                self.window.rootViewController = self.tableViewController2;
                
                // ナビゲーションコントローラにベースとなるコントローラをセット
                self.tableViewController2 = [[TableViewController2 alloc]init];
                _navigationController = [[UINavigationController alloc] initWithRootViewController:_tableViewController2];
                
                // ナビゲーションコントローラのビューをウィンドウに貼付ける
                self.window.rootViewController = self.tableViewController3;
            }
            break;
        case 3:
            {
                // ナビゲーションコントローラにベースとなるコントローラをセット
                self.tableViewController3 = [[TableViewController3 alloc]init];
                // ナビゲーションコントローラのビューをウィンドウに貼付ける
                self.window.rootViewController = self.tableViewController3;
            }
            break;
        case 4:
            {
                self.viewController22 = [[UNViewController22 alloc]initWithNibName:@"UNViewController21" bundle:nil];
                self.window.rootViewController = self.viewController22;
            }
            break;
    }

    [self.window makeKeyAndVisible];
		
    return YES;
}

@end
