//
//  TabBarController.m
//  UNTabBarController
//
//  Created by UnnoShusuke on 2014/10/08.
//  Copyright (c) 2014年 UnnoShusuke. All rights reserved.
//

#import "TabBarController.h"

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
        
        for(int i=0; i<2; i++){
            UIViewController *vc = [[UIViewController alloc]initWithNibName:@"ViewController2" bundle:nil];
            UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:vc];
            [vcs addObject:navi];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
