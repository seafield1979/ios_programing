//
//  TabBarController.m
//  UNTabBarController
//
//  Created by UnnoShusuke on 2014/10/08.
//  Copyright (c) 2014年 UnnoShusuke. All rights reserved.
//

#import "TabBarController.h"

#define DEBUG_NAVIGATION_MODE    (0)

@interface TabBarController ()

@end

@implementation TabBarController

static TabBarController *_sharedTabBarController;

+ (TabBarController *)sharedController
{
    if (!_sharedTabBarController) {
        _sharedTabBarController = [[TabBarController alloc] initWithNibName:nil bundle:nil];
        
        // タブにビューコントローラを登録する
        NSMutableArray *vcs = [NSMutableArray array];
        
        NSArray *tabViewControllerName =
        @[@"ViewController", @"ViewController2", @"ViewController3", @"ViewController4"];

        for(int i=0; i<tabViewControllerName.count; i++){
#if DEBUG_NAVIGATION_MODE
            // ナビゲーションあり
            UIViewController *vc = [[UIViewController alloc]initWithNibName:tabViewControllerName[i] bundle:nil];
            UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:vc];
            [vcs addObject:navi];
#else
            // ナビゲーションなし
            UIViewController *vc = [[UIViewController alloc]initWithNibName:tabViewControllerName[i] bundle:nil];
            [vcs addObject:vc];
#endif
        }
        [_sharedTabBarController setViewControllers:vcs animated:NO];
    }
    return _sharedTabBarController;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSBundle mainBundle] loadNibNamed:@"TabBarController" owner:self options:nil];
    [self.tabBar addSubview:self.originalTabbar];
    
}

/*
 *
 */
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
   
    // これをやらないとボタンが反応しない
    [self.tabBar bringSubviewToFront:self.originalTabbar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


/*
 * タブボタンが押されたときの処理
 */
- (IBAction)tabButtonDidTap:(id)sender {
    NSLog(@"tabButtonDidTap:");
    
    for(UIButton *button in self.tabbars){
        button.backgroundColor = [UIColor clearColor];
    }
    
    UIButton *button = (UIButton*)sender;
    switch (button.tag) {
        case 1:
            self.selectedIndex = 0;
            button.backgroundColor = [UIColor blackColor];
            break;
        case 2:
            self.selectedIndex = 1;
            button.backgroundColor = [UIColor blackColor];
            break;
        case 3:
            self.selectedIndex = 2;
            button.backgroundColor = [UIColor blackColor];
            break;
        case 4:
            self.selectedIndex = 3;
            button.backgroundColor = [UIColor blackColor];
            break;
        default:
            break;
    }
    
}
@end
