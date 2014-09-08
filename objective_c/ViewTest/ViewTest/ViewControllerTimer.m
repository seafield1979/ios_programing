//
//  ViewControllerTimer.m
//  ViewTest
//
//  Created by B02681 on 2014/09/08.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//
/*
 NSTimerのサンプル
 */

#import "ViewControllerTimer.h"

@interface ViewControllerTimer ()

@end

@implementation ViewControllerTimer

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
    // Do any additional setup after loading the view from its nib.
    
    _timerView = [[TimerView alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
    _timerView.backgroundColor = [UIColor redColor];
    _timerView.delegate = self;
    [_timerView timerFunc1:@"end1"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Action method



- (IBAction)timer1ButtonDidTap:(id)sender {
    
    NSDictionary *param = @{@"name" : @"Unno Shutaro", @"address" : @"Kanagawa Pref.", };
    
    // タイマー終了後のコールバックを設定する
    [NSTimer
     scheduledTimerWithTimeInterval:1.5f    // タイマーを発生させる間隔(秒)
     target:[NSBlockOperation blockOperationWithBlock:^{ NSLog(@"start1"); }]                            // タイマー発生時に呼び出すメソッドがあるターゲット
     selector:@selector(main)        // タイマー発生時に呼び出すメソッド
     userInfo:param                           // selectorで呼び出すメソッドに渡す情報(NSDictionary)
     repeats:YES                            // タイマーの実行を繰り返すかどうかの指定 （YES：繰り返す　NO：１回のみ）
     ];
    NSLog(@"start");
}

- (void)timer1Func:(NSTimer*)timer
{
    NSDictionary *param = timer.userInfo;
    
    NSLog(@"name: %@", param[@"name"]);
    NSLog(@"address: %@", param[@"address"]);
}


/*
 * タイマー用のViewを生成し、ViewからDelegateを呼び出す
 */
- (IBAction)timer2ButtonDidTap:(id)sender {
    
//    [_timerView timerFunc1:@"hello end"];
    [_timerView timerFunc1: nil];
}


#pragma mark - TimerViewDelegate


-(void)endTimer
{
    NSLog(@"TimerViewDelegate:endTimer");
}

-(void)endTimerWithMessage:(NSString*)message
{
    NSLog(@"TimerViewDelegate:endTimerWithMessage:%@", message);
}

@end
