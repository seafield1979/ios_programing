//
//  ViewController2.m
//  ViewTest
//
//  Created by 海野 秀祐 on 2014/08/07.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//
/*
 サンプルの内容
   UIProgressView
   タイマー(NSTimer scheduledTimerWithTimeInterval)
   UIActionSheet
 
 */

#import "ViewController2.h"

@interface ViewController2 ()
{
	UIProgressView *_pv;
	NSTimer *_tm;
	UIActionSheet *_as;
}
@end

@implementation ViewController2

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

	_pv = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
	_pv.frame = CGRectMake(100, 50, 200, 30);
	_pv.progress = 0.0;
	[self.view addSubview:_pv];

	//アクションシート
	_as = [[UIActionSheet alloc]init];
	_as.delegate = self;
	_as.title = @"選択してください。";
	[_as addButtonWithTitle:@"実行1"];
  	[_as addButtonWithTitle:@"実行2"];
	[_as addButtonWithTitle:@"キャンセル"];
	_as.cancelButtonIndex = 2;
	_as.destructiveButtonIndex = 0;
//	[_as showInView:self.view];  // ※下記参照
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Action method
/*
 * プログレスバーテスト
 */
-(IBAction)pushButton1:(id)sender
{
	// タイマーの生成例
	_tm =
	[NSTimer
	 scheduledTimerWithTimeInterval:1.0f    // タイマーを発生させる間隔(秒)
	 target:self                            // タイマー発生時に呼び出すメソッドがあるターゲット
	 selector:@selector(timerFunc1:)        // タイマー発生時に呼び出すメソッド
	 userInfo:nil                           // selectorで呼び出すメソッドに渡す情報(NSDictionary)
	 repeats:YES                            // タイマーの実行を繰り返すかどうかの指定 （YES：繰り返す　NO：１回のみ）
	 ];
}

/*
 * アクションシートテスト
 */
-(IBAction)pushButton2:(id)sender
{
	[_as showInView:self.view];
}

-(void)timerFunc1:(NSTimer*)timer
{
	if( _pv.progress < 1.0){
		_pv.progress += 0.1f;
	}
	if(_pv.progress > 1.0){
		_pv.progress = 1.0f;
		[_tm invalidate];
	}
}

#pragma mark _UIActionSheetDelegate

// アクションシートのボタンが押された時に呼ばれるデリゲート例文
-(void)actionSheet:(UIActionSheet*)actionSheet
clickedButtonAtIndex:(NSInteger)buttonIndex
{
	NSLog(@"clickedButtonAtIndex %d", buttonIndex);
	switch (buttonIndex) {
		case 0:
			// １番目のボタンが押されたときの処理を記述する
            NSLog(@"実行1");
			break;
		case 1:
			// ２番目のボタンが押されたときの処理を記述する
            NSLog(@"実行2");
			break;
		case 2:
			// ３番目のボタンが押されたときの処理を記述する
            NSLog(@"キャンセル");
			break;
	}
}

//表示直前に呼ばれるメソッド
-(void)willPresentActionSheet:(UIActionSheet*)actionSheet
{
	NSLog(@"アクションシート表示した");
}

//閉じた直後に呼ばれるメソッド
-(void)actionSheet:(UIActionSheet*)actionSheet
	didDismissWithButtonIndex: (NSInteger)buttonIndex
{
	NSLog(@"アクションシート閉じた");
}


@end
