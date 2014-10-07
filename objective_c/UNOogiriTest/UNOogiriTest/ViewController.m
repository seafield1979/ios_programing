//
//  ViewController.m
//  UNOogiriTest
//
//  Created by B02681 on 2014/09/30.
//  Copyright (c) 2014年 B02681. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // タブバーを生成
    self.tabView = [[UNTabScrollView alloc] init];
    
    NSArray *buttonList = @[@{@"title" : @"1", @"color" : @"1"},
                            @{@"title" : @"2", @"color" : @"1"},
                            @{@"title" : @"3", @"color" : @"1"},
                            @{@"title" : @"4", @"color" : @"1"},
                            @{@"title" : @"5", @"color" : @"1"},
                            @{@"title" : @"6", @"color" : @"1"},
                            @{@"title" : @"7", @"color" : @"1"},
                            @{@"title" : @"8", @"color" : @"1"},
                            @{@"title" : @"9", @"color" : @"1"},
                            @{@"title" : @"10", @"color" : @"1"},
                            @{@"title" : @"11", @"color" : @"1"},
                            @{@"title" : @"12", @"color" : @"1"}];
    [self.tabView initWithButtonList: buttonList];
    [self.view addSubview:self.tabView];
    
    self.menuViewController = [[UNMenuViewController alloc] initWithNibName:@"UNMenuViewController" bundle:nil];
#if 0  // ジェスチャーテスト
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];

    //ジェスチャーをUIViewオブジェクトに登録する
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonTapped:)];
    [view1 addGestureRecognizer: recognizer];
    view1.userInteractionEnabled = YES;
#endif
    [self.view addSubview:self.menuViewController.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private method

-(void)buttonTapped:(id)sender
{
    NSLog(@"ok");
}

#pragma mark - Public method

- (IBAction)tableViewButtonDidTap:(id)sender {
    
    
}
@end
