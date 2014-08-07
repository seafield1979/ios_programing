//
//  ViewController.m
//  AOTutorialSample
//
//  Created by B02681 on 2014/08/07.
//  Copyright (c) 2014年 B02681. All rights reserved.
//

#import "ViewController.h"

typedef enum{
	STATE_INIT = 0,			// 初期状態
	STATE_TELOP_APP1,		//「この画像、あなたならどうボケる？？」の表示１ 0%->110%->100%
	STATE_TELOP_WAIT,		//「この画像、あなたならどうボケる？？」の表示中
	STATE_BOKE_APPEAR,		// ボケのテキスト出現中
	STATE_BOKE_WAIT,		// ボケテキスト表示
	STATE_ZABU_APPEAR,		// 座布団出現中
	STATE_ZABU_WAIT,		// 座布団を３回押すまで
	STATE_PAGE_MOVING,		// ページ遷移
	STATE_PAGE_WAIT,		// ページ遷移後の待ち
	STATE_BUTTON_APPEAR,	// ログインボタン表示中
	STATE_BUTTON_WAIT		// ボタンが押されるまで
}TutorialState;

@interface ViewController ()
{
	int state;
	int timerCount;
	NSTimer *_tm;
	CGRect screenRect;
}

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		state = STATE_INIT;
		timerCount = 0;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	
	screenRect = [[UIScreen mainScreen] bounds];
	
	_page1View.frame = CGRectMake(0, 20, screenRect.size.width, screenRect.size.height);
	[self.view addSubview:_page1View];
	
	// いろいろ非表示
	_telop1View.hidden = YES;
	_telop2View.hidden = YES;
	
	
	_tm =
	[NSTimer
		scheduledTimerWithTimeInterval:2.0f    // タイマーを発生させる間隔(秒)
		target:self                            // タイマー発生時に呼び出すメソッドがあるターゲット
		selector:@selector(stateFunc)        // タイマー発生時に呼び出すメソッド
		userInfo:nil                           // selectorで呼び出すメソッドに渡す情報(NSDictionary)
		repeats:YES                            // タイマーの実行を繰り返すかどうかの指定 （YES：繰り返す　NO：１回のみ）
	 ];
	state = STATE_TELOP_APP1;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

// 各種状態で行う処理
-(void)stateFunc{
	NSLog(@"stateFunc %d", state);
	switch(state){
		case STATE_TELOP_APP1:		//「この画像、あなたならどうボケる？？」の表示１ 0%->110%
			{
				state++;
				_telop1View.hidden = NO;
				CGRect rect = _telop1View.frame;
				CGRect rect2;
				rect2 = _telop1View.frame = CGRectMake(rect.origin.x + rect.size.width / 2,
											   rect.origin.y + rect.size.height / 2,
											   0, 0);
				[UIView animateWithDuration:0.7f
					delay:0.0
//					options:UIViewAnimationOptionCurveEaseIn
 					options:UIViewAnimationOptionCurveLinear
					animations:^(void){
						_telop1View.frame = CGRectMake(rect2.origin.x - rect.size.width * 0.55,
												   rect2.origin.y - rect.size.height * 0.55,
												   rect.size.width * 1.1, rect.size.height * 1.1);
					}
				 completion:^(BOOL finished){
					 [UIView animateWithDuration:0.2f
										   delay: 0.0f
//										 options:UIViewAnimationOptionCurveEaseOut
										 options:UIViewAnimationOptionCurveLinear
						animations:^(void){
						 _telop1View.frame = CGRectMake(rect2.origin.x - rect.size.width * 0.5,
														rect2.origin.y - rect.size.height * 0.5,
														rect.size.width, rect.size.height);
					 }
						  completion:^(BOOL finished){
							  [self stateFunc];
						  }];
				 }];
			}
			break;
		case STATE_TELOP_WAIT:		//「この画像、あなたならどうボケる？？」の表示中
			state++;
			{
				CGRect text2OriginRect = _bokeText2View.frame;
				_bokeText2View.frame = CGRectMake(text2OriginRect.origin.x + text2OriginRect.size.width / 2,
											  text2OriginRect.origin.y + text2OriginRect.size.height / 2,
											  0, 0);
				_bokeText2View.hidden = NO;
				
				[UIView animateWithDuration:1.0f
								animations:^(void){
									// ???を縮小
									CGRect rect = _bokeText1View.frame;
									_bokeText1View.frame = CGRectMake(rect.origin.x + rect.size.width / 2,
																	rect.origin.y + rect.size.height / 2,
																	  0, 0);
									// ボケを拡大
									_bokeText2View.frame = text2OriginRect;
								}
								completion:^(BOOL finished){
									[self stateFunc];
								}];
			}
			break;
		case STATE_BOKE_APPEAR:		// ボケのテキスト出現中
			state++;
			break;
		case STATE_BOKE_WAIT:		// ボケテキスト表示
			state++;
			break;
		case STATE_ZABU_APPEAR:		// 座布団出現中
			state++;
			break;
		case STATE_ZABU_WAIT:		// 座布団を３回押すまで
			state++;
			break;
		case STATE_PAGE_MOVING:		// ページ遷移
			state++;
			break;
		case STATE_PAGE_WAIT:		// ページ遷移後の待ち
			state++;
			break;
		case STATE_BUTTON_APPEAR:	// ログインボタン表示中
			state++;
			break;
		case STATE_BUTTON_WAIT:		// ボタンが押されるまで
			state++;
			break;
	}
	
	
	// 停止
	[_tm invalidate];
}


- (IBAction)pushButton1:(id)sender {
	NSLog(@"pushButton1");
	
	UIAlertView *alert =
	[[UIAlertView alloc]
	 initWithTitle:@"ViewController"
	 message:@"pushButton1"
	 delegate:nil
	 cancelButtonTitle:@"NG"
	 otherButtonTitles:@"OK", nil
	 ];
	alert.delegate = self;
	[alert show];
}

// アラートのボタンが押された時に呼ばれるデリゲート例文
-(void)alertView:(UIAlertView*)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex {
	
	switch (buttonIndex) {
		case 0:
			//１番目のボタンが押されたときの処理を記述する
			NSLog(@"Cancel button");
			break;
		case 1:
			//２番目のボタンが押されたときの処理を記述する
			NSLog(@"OK button");
			break;
	}
	
}

@end
