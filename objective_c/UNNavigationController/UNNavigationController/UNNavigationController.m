//
//  UNNavigationController.m
//  UNNavigationController
//
//  Created by UnnoShusuke on 2014/08/24.
//  Copyright (c) 2014年 UnnoShusuke. All rights reserved.
//

#import "UNNavigationController.h"

@interface UNNavigationController ()

@end

@implementation UNNavigationController

#pragma mark - Lifecycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self setCenterBarItem: self.centerBarItem2];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)logoButtonDidTap:(id)sender
{
    NSLog(@"logoButtonDidTap");
}


#pragma mark - Accessor
- (UIView *)centerBarItem2
{
    // ルートのオブジェクトを返す
    if (!_logoButton) {
        _logoButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_logoButton setImage:[UIImage imageNamed:@"navi_button1"] forState:UIControlStateNormal];
        [_logoButton sizeToFit];
        [_logoButton addTarget:self action:@selector(logoButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _logoButton;
}
- (void)setCenterBarItem:(UIView *)centerBarItem
{
    static BOOL _lock = NO;
    
    if (!centerBarItem || centerBarItem == _centerBarItem2 || _lock) return;
    
    _lock = YES;
    
    // 既存のアイテムを外す
    [_centerBarItem2 removeFromSuperview];
    
    // 新たなアイテムを追加
    _centerBarItem2 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];

    //---------------------
    // 背景色
    //---------------------
#if 0
    // 画像を背景として使用
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"dot_line"] forBarMetrics: UIBarMetricsDefault];
#else
    // 背景色を設定
    [UINavigationBar appearance].barTintColor = [UIColor colorWithRed:0.000 green:0.549 blue:0.890 alpha:1.000];
#endif
    // タイトルの設定
#if 0
    UIView *addView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
    addView.backgroundColor = [UIColor whiteColor];
    [self.navigationBar addSubview:addView];
#endif
#if 0
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"navi_button1"]];
    [self.navigationBar addSubview:imageView];
#endif
#if 1
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 10, 200, 30)];
    [button setTitle:@"centerButton" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(centerButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationBar addSubview:button];
#endif
    
    
}


#pragma mark - Event method
-(void)centerButtonDidTap:(id)center
{
    NSLog(@"centerButtonDidTap");
}

@end
