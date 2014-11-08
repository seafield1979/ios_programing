//
//  ViewController.m
//  UNNavigationController
//
//  Created by UnnoShusuke on 2014/08/24.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

// ナビゲーションタイトル 1:テキスト / 2:画像
#define TITLE     (1)

// 左ボタン 1:戻る / 2:左ボタン / 3:非表示
#define LEFT_BUTTON  (2)

// 右ボタン
#define RIGHT_BUTTON  (1)

// 中央ボタン
#define CENTER_BUTTON  (1)

//-------------------------------------
// interface
//-------------------------------------
@interface ViewController ()

@property (strong, nonatomic) UIView *centerBarItem1;

@end

//-------------------------------------
// implementation
//-------------------------------------
#pragma mark - Life cycle

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // ページ数を取得
    int naviCount = [self.navigationController.viewControllers count];
    self.label1.text = [NSString stringWithFormat:@"page:%d", naviCount];
    
    // 背景色
    [UINavigationBar appearance].barTintColor = [UIColor colorWithRed:0.000 green:0.549 blue:0.890 alpha:1.000];

    
#if LEFT_BUTTON == 1
    // 戻るボタンのテキストを変更
    UIBarButtonItem *backButton = [UIBarButtonItem new];
    backButton.title = @"戻る";
    self.navigationItem.backBarButtonItem = backButton;
#elif LEFT_BUTTON == 2
    // 左ボタン
    UIBarButtonItem *leftButton =
    [[UIBarButtonItem alloc]
     initWithTitle:@"左ボタン"           // ボタンタイトル名を指定
     style:UIBarButtonItemStylePlain    // スタイルを指定
     target:self                        // デリゲートのターゲットを指定
     action:@selector(leftBarButtonDidTap:)  // ボタンが押されたときに呼ばれるメソッドを指定
     ];
    self.navigationItem.leftBarButtonItem = leftButton;
#else
    // 戻るボタンを非表示
    [self.navigationItem setHidesBackButton:YES];
#endif
    
    // 右ボタン
#if RIGHT_BUTTON == 1
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"右ボタン" style:UIBarButtonItemStylePlain target:self action:@selector(pushRightButton:)];
    self.navigationItem.rightBarButtonItem = rightButton;
#endif
    
    // 中央ボタン
#if CENTER_BUTTON == 1
    // タイトル文字列
    self.navigationItem.title = [NSString stringWithFormat:@"page %d", naviCount];
    
#elif CENTER_BUTTON == 2
    [self setCenterBarItem : self.centerBarItem1];
    // タイトル文字列を非表示
    self.navigationItem.title = nil;
#endif
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"viewWillAppear: %d", self.navigationController.viewControllers.count);
    
    if (self.navigationController.viewControllers.count == 1){
        self.navigationItem.leftBarButtonItem = nil;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


/*
 * 新しいViewControllerをプッシュする
 */
- (IBAction)pushPushButton:(id)sender {
    //新しいViewControllerを作成してPushする
    ViewController *vc = [[ViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

/*
 * ナビゲーションにポップされたViewControllerをポップする
 */
- (IBAction)pushPopButton:(id)sender {
    
    // 1ページポップする
    [self.navigationController popViewControllerAnimated:YES];
    
    // ルートまでポップする
    //[self.navigationController popToRootViewControllerAnimated:YES];
}



#pragma mark - Private method

/*
 * 左ボタンをタップしたときの処理
 */
- (void)leftBarButtonDidTap:(id)sender
{
    NSLog(@"pushLeftButton");
}

/*
 * 右ボタンをタップしたときの処理
 */
-(void)pushRightButton:(id)selector
{
    NSLog(@"pushRightButton");
}

/*
 * 中央ボタンをタップしたときの処理
 */
-(void)centerButtonDidTap:(id)selector
{
    NSLog(@"centerButtonDidTap:");
}

- (void)setCenterBarItem:(UIView *)centerBarItem
{
    static BOOL _lock = NO;
    
    if (!centerBarItem || centerBarItem == _centerBarItem1 || _lock) return;
    
    _lock = YES;
    
    // 既存のアイテムを外す
    [self.centerBarItem1 removeFromSuperview];
    
    // ナビゲーションの中央に配置
    centerBarItem.center = CGPointMake(self.navigationController.navigationBar.frame.size.width / 2, self.navigationController.navigationBar.frame.size.height / 2);
    
    // ナビゲーションにsubViewとして追加
    [self.navigationController.navigationBar addSubview:centerBarItem];
    _centerBarItem1 = centerBarItem;
    
    _lock = NO;
}


#pragma mark - Accessor
- (UIView *)centerBarItem1
{
    // ルートのオブジェクトを返す
    if (!self.logoButton) {
        self.logoButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.logoButton setImage:[UIImage imageNamed:@"navi_button1"] forState:UIControlStateNormal];
        [self.logoButton sizeToFit];
        [self.logoButton addTarget:self action:@selector(centerButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self.logoButton;
}

@end
