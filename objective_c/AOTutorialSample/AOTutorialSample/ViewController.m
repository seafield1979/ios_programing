//
//  ViewController.m
//  AOTutorialSample
//
//  Created by B02681 on 2014/08/07.
//  Copyright (c) 2014年 B02681. All rights reserved.
//

#import "ViewController.h"

typedef enum{
	TUTO_INIT = 0,			// 初期状態
	TUTO_FADE_IN,           // 初期フェードイン
	TUTO_TELOP_APP,         // ？？？、「この画像、あなたならどうボケる？？」の表示
	TUTO_TELOP_WAIT,		// 表示待ち1
	TUTO_BOKE_APP,		    // ボケテキストの表示
	TUTO_ZABUTON_APP,       // 座布団、「座布団をタップしてみよう」の表示
	TUTO_ZABUTON_WAIT,		// 座布団がタッチされるまでの待ち
	TUTO_ZABUTON_ANIM,      // 座布団アニメーション
	TUTO_TELOP2_APP,        // 「気軽にボケられるよ」の表示
	TUTO_TELOP2_WAIT,       // 「気軽にボケられるよ」の待ち
	TUTO_FADE_OUT_1,		// フェードアウト1
	TUTO_FADE_IN_2,         // フェードイン2
	TUTO_LAST_WAIT			// ログインorスキップボタンが押されるのの待ち
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
		state = TUTO_INIT;
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
	_bokeText1View.hidden = YES;
	_bokeText2View.hidden = YES;
	_howToBokeView.hidden = YES;
	_telop2View.hidden = YES;
	_letsBokeView.hidden = YES;
	_balloneView.hidden = YES;
	
	
	[self init_TUTO_FADE_IN];
}


-(void) init_TUTO_INIT			// 初期状態
{
	//	_tm =
	//	[NSTimer
	//	 scheduledTimerWithTimeInterval:2.0f    // タイマーを発生させる間隔(秒)
	//	 target:self                            // タイマー発生時に呼び出すメソッドがあるターゲット
	//	 selector:@selector(stateFunc)        // タイマー発生時に呼び出すメソッド
	//	 userInfo:nil                           // selectorで呼び出すメソッドに渡す情報(NSDictionary)
	//	 repeats:YES                            // タイマーの実行を繰り返すかどうかの指定 （YES：繰り返す　NO：１回のみ）
	//	];

}
-(void) init_TUTO_FADE_IN           // 初期フェードイン
{
	state = TUTO_FADE_IN;
	_page1View.alpha = 0.0;
	
	[UIView animateWithDuration:1.0f
						  delay:0.0
						options:UIViewAnimationOptionCurveLinear
					 animations:^(void){
						 _page1View.alpha = 1.0;
					 }
					 completion:^(BOOL finished){
					 }
	 ];
}
-(void) TUTO_TELOP_APP         // ？？？、「この画像、あなたならどうボケる？？」の表示
{
	
}
-(void) TUTO_TELOP_WAIT		// 表示待ち1
{
	
}
-(void) TUTO_BOKE_APP		    // ボケテキストの表示
{
	
}
-(void) TUTO_ZABUTON_APP       // 座布団、「座布団をタップしてみよう」の表示
{
	
}
-(void) TUTO_ZABUTON_WAIT		// 座布団がタッチされるまでの待ち
{
	
}
-(void) TUTO_ZABUTON_ANIM      // 座布団アニメーション
{
	
}
-(void) TUTO_TELOP2_APP        // 「気軽にボケられるよ」の表示
{
	
}
-(void) TUTO_TELOP2_WAIT       // 「気軽にボケられるよ」の待ち
{
	
}
-(void) TUTO_FADE_OUT_1		// フェードアウト1
{
	
}
-(void) TUTO_FADE_IN_2         // フェードイン2
{
	
}
-(void) TUTO_LAST_WAIT			// ログインorスキップボタンが押されるのの待ち
{
	
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

// 各種状態で行う処理
#if 0
-(void)stateFunc{
	NSLog(@"stateFunc %d", state);
	switch(state){
		case TUTO_TELOP_APP1:		//「この画像、あなたならどうボケる？？」の表示１ 0%->110%
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
		case TUTO_TELOP_WAIT:		//「この画像、あなたならどうボケる？？」の表示中
			state++;
			{
				CGRect text2OriginRect = _bokeText2View.frame;
				_bokeText2View.hidden = NO;
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
		case TUTO_BOKE_APPEAR:		// ボケのテキスト出現中
			state++;
			break;
		case TUTO_BOKE_WAIT:		// ボケテキスト表示
			state++;
			break;
		case TUTO_ZABU_APPEAR:		// 座布団出現中
			state++;
			break;
		case TUTO_ZABU_WAIT:		// 座布団を３回押すまで
			state++;
			break;
		case TUTO_PAGE_MOVING:		// ページ遷移
			state++;
			break;
		case TUTO_PAGE_WAIT:		// ページ遷移後の待ち
			state++;
			break;
		case TUTO_BUTTON_APPEAR:	// ログインボタン表示中
			state++;
			break;
		case TUTO_BUTTON_WAIT:		// ボタンが押されるまで
			state++;
			break;
	}
	
	
	// 停止
	[_tm invalidate];
}
#endif


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



/*------------------------------------------------------------------
 *  タッチを
 *------------------------------------------------------------------*/

typedef enum{
	ZABU_INIT = 0,		// タッチされていない
	ZABU_TOUCH_START,	// タッチされた
	ZABU_TOUCH_END,		// タッチ離された
	ZABU_STOP
}ZabutonState;

@interface ZabutonView ()
{
	int state;
	int count;
	NSMutableArray *images;
}

@end
@implementation ZabutonView
-(id)init
{
	self = [super init];
	if(self){
		// 座布団で使用する画像を生成
		NSArray *imageName = @[@"aaa.png", @"bbb.png", @"ccc.png", @"ddd.png", @"eee.png"];
		images = [[NSMutableArray alloc]init];
		for(NSString *name in imageName){
			[images addObject:[UIImage imageNamed:name]];
		}
		count = 0;
	}
	return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	// タッチされたときの処理
	NSLog(@"touchesBegan");
	if(count >= 3){
		return;
	}
	switch(state){
		case ZABU_INIT:
			// 座布団押されたときのアニメーション
			[UIView animateWithDuration:0.1f
				 animations:^(void){
					 
				 }
			 completion:^(BOOL finished){
				 
			 }
			 ];
			break;
	}
}
			 
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	NSLog(@"touchesEnded");
}


@end
