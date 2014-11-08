//
//  ViewControllerLifeCycle.m
//  ViewTest
//
//  Created by UnnoShusuke on 2014/11/08.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewControllerLifeCycle.h"
#import "ViewController.h"

@interface ViewControllerLifeCycle ()

@end

@implementation ViewControllerLifeCycle

#pragma mark - Life cycle

/*
 　・View が初めて呼び出される時に1回だけ呼ばれます。
 　・アプリ起動後に初めて当Viewが表示された場合に1度だけ呼ばれます。
*/
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"viewDidLoad");
}

/*
 　・View が表示される直前に呼ばれるメソッド
 　・タブ等の切り替え等により、画面に表示されるたびに呼び出されます。
 　・タブが切り替わるたびに何度でも呼ばれます。
*/
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
}

/*
 　・View の表示が完了後に呼び出されるメッソド
 　・タブ等の切り替え等により、画面に表示されるたびに呼び出されます。
 　・タブが切り替わるたびに何度でも呼ばれます。
*/
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear");
}

/*
 　・View が他のView (画面から消える) 直前に呼び出されるメッソド
 　・View が他のView (画面から消える) 直前に呼び出されるメッソド
 　・タブが切り替わるたびに何度でも呼ばれます。
 */
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"viewWillDisappear");
}

/*
 　・View が他のView (画面から消えた) 非表示後に呼び出されるメッソド
 　・View が他のView (画面から消える) 直前に呼び出されるメッソド
 　・タブが切り替わるたびに何度でも呼ばれます。
 */
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    NSLog(@"viewDidDisappear");
}

/*
 * メモリ使用量が少なくなったときに呼ばれる
 */
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - Action method

/*
 * VCを切り替える
 * これでViewControllerLifeCycleが消えるのでviewWillDisappear, viewDidDisappearがコールされる
 */
- (IBAction)changeVCDidTap:(id)sender {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    appDelegate.window.rootViewController = [[ViewController alloc] initWithNibName: @"ViewController" bundle:[NSBundle mainBundle]];
    
}

/*
 * VCのviewを追加
 */
- (IBAction)addButtonDidTap:(id)sender {
    ViewController *vc = [[ViewController alloc] initWithNibName: @"ViewController" bundle:[NSBundle mainBundle]];
    [self.view addSubview:vc.view];
    
}
@end
