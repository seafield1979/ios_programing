//
//  TabBarController.m
//  UNTabBarController
//
//  Created by UnnoShusuke on 2014/10/08.
//  Copyright (c) 2014年 UnnoShusuke. All rights reserved.
//
/*
   TabBarControllerを独自のViewにカスタマイズするテンプレート
   以下要点
   1.TabBarはシングルトンなのでsharedオブジェクトを返す sharedControllerでオブジェクトを生成する
   2.TabBarのviewにaddSubviewで自前のviewを追加する
   3.2でaddSubviewしたviewを self.tabbarの最前面に移動する
 */

#import "TabBarController.h"

#define DEBUG_NAVIGATION_MODE    (1)



/// ナビゲーションバー高さ
#define kNavigationBarHeight                        (49)

/// ナビの表示アニメーション時間
#define kNaviShowDulation                           (0.3)

@interface TabBarController ()

@property (nonatomic) CGFloat barBaseTop;        // タブバーのベースy座標
@property (nonatomic) BOOL isShow;				    // タブバーの表示フラグ
@property (nonatomic) BOOL isTbAnimating;			// タブバーの表示アニメーション中フラグ

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
        @[@"ViewController",
          @"ViewController2",
          @"ViewController3",
          @"ViewController4"];

        for(int i=0; i<tabViewControllerName.count; i++){
            Class vcClass = NSClassFromString(tabViewControllerName[i]);
            
#if DEBUG_NAVIGATION_MODE
            // ナビゲーションあり
            UIViewController *vc = [[vcClass alloc]initWithNibName:tabViewControllerName[i] bundle:nil];
            UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:vc];
            [vcs addObject:navi];
#else
            // ナビゲーションなし
            UIViewController *vc = [[vcClass alloc]initWithNibName:tabViewControllerName[i] bundle:nil];
            [vcs addObject:vc];
#endif
        }
        [_sharedTabBarController setViewControllers:vcs animated:NO];
    }
    return _sharedTabBarController;
}

#pragma mark - Life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSBundle mainBundle] loadNibNamed:@"TabBarController" owner:self options:nil];
    [self.tabBar addSubview:self.originalTabbar];
    
    self.isShow = YES;
    
    // OSバージョンによるレイアウトの調整
    self.barBaseTop = [[UIScreen mainScreen]bounds].size.height - kNavigationBarHeight;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
   
    // これをやらないとボタンが反応しない
    [self.tabBar bringSubviewToFront:self.originalTabbar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Action method

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
            button.backgroundColor = [UIColor whiteColor];
            break;
        case 2:
            self.selectedIndex = 1;
            button.backgroundColor = [UIColor whiteColor];
            break;
        case 3:
            self.selectedIndex = 2;
            button.backgroundColor = [UIColor whiteColor];
            break;
        case 4:
            self.selectedIndex = 3;
            button.backgroundColor = [UIColor whiteColor];
            break;
        default:
            break;
    }
}


#pragma mark - Private method

#pragma mark - Public method
/*
 * タブバーを表示する
 * @param showFlag  NO:非表示 / YES:表示
 */
- (void)showAnimated:(BOOL)isShow
{
    if( !self.isTbAnimating && self.isShow != isShow ){
        self.isShow = isShow;
        self.isTbAnimating = YES;
        
        [UIView animateWithDuration:kNaviShowDulation
                         animations:^{
                             // アニメーションをする処理
                             float top = isShow ? self.barBaseTop : self.barBaseTop + self.tabBar.frame.size.height;
                             
                             //TabBarを移動
                             self.tabBar.frame = CGRectMake(0.0f, top, self.tabBar.frame.size.width, self.tabBar.frame.size.height);
                         }
                         completion:^(BOOL finished){
                             self.isTbAnimating = NO;
                         }];
    }
}



@end
