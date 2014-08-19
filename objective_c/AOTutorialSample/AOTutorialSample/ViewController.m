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
	TUTO_TELOP_DISAPP,      // ？？？、「この画像、あなたならどうボケる？？」の非表示
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
	
	_page1View.hidden = NO;
	_page2View.hidden = YES;
	_page1View.frame = CGRectMake(0, 20, screenRect.size.width, screenRect.size.height);
	
	[self.view addSubview:_page1View];

	_page2View.frame = CGRectMake(0, 20, screenRect.size.width, screenRect.size.height);
	[self.view addSubview:_page2View];
	
	// いろいろ非表示
#if 1
	_bokeText1View.hidden = YES;
	_bokeText2View.hidden = YES;
	_howToBokeView.hidden = YES;
	_letsTapView.hidden = YES;
	_letsBokeView.hidden = YES;
	_balloneView.hidden = YES;
	_zabutonView.hidden = YES;
	
	
	[self init_TUTO_FADE_IN];
#endif
}


-(void) init_TUTO_INIT			// 初期状態
{
    /*
		_tm =
		[NSTimer
		 scheduledTimerWithTimeInterval:2.0f    // タイマーを発生させる間隔(秒)
		 target:self                            // タイマー発生時に呼び出すメソッドがあるターゲット
		 selector:@selector(stateFunc)        // タイマー発生時に呼び出すメソッド
		 userInfo:nil                           // selectorで呼び出すメソッドに渡す情報(NSDictionary)
		 repeats:YES                            // タイマーの実行を繰り返すかどうかの指定 （YES：繰り返す　NO：１回のみ）
		];
     */

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
                    [self init_TUTO_TELOP_APP];
					 }
	 ];
}
-(void) init_TUTO_TELOP_APP         // ？？？、「この画像、あなたならどうボケる？？」の表示
{
    NSLog(@"init_TUTO_TELOP_APP");
	state = TUTO_TELOP_APP;
    
    // ？？？を表示
    _tm =
    [NSTimer
     scheduledTimerWithTimeInterval:1.0f    // タイマーを発生させる間隔(秒)
     target:self                            // タイマー発生時に呼び出すメソッドがあるターゲット
     selector:@selector(TUTO_TELOP_APP_timer_func1)        // タイマー発生時に呼び出すメソッド
     userInfo:nil                           // selectorで呼び出すメソッドに渡す情報(NSDictionary)
     repeats:NO                            // タイマーの実行を繰り返すかどうかの指定 （YES：繰り返す　NO：１回のみ）
     ];
    
    // この画像、あなたならどうボケる？を表示
    _tm =
    [NSTimer
     scheduledTimerWithTimeInterval:2.0f    // タイマーを発生させる間隔(秒)
     target:self                            // タイマー発生時に呼び出すメソッドがあるターゲット
     selector:@selector(TUTO_TELOP_APP_timer_func2)        // タイマー発生時に呼び出すメソッド
     userInfo:nil                           // selectorで呼び出すメソッドに渡す情報(NSDictionary)
     repeats:NO                            // タイマーの実行を繰り返すかどうかの指定 （YES：繰り返す　NO：１回のみ）
     ];
    
    
}
-(void)TUTO_TELOP_APP_timer_func1
{
    NSLog(@"timer1");
	_bokeText1View.hidden = NO;
	
}
-(void)TUTO_TELOP_APP_timer_func2
{
    NSLog(@"timer2");
	_howToBokeView.hidden = NO;
    [self init_TUTO_TELOP_WAIT];
}


// 表示待ち1
-(void) init_TUTO_TELOP_WAIT
{
    NSLog(@"init_TUTO_TELOP_WAIT");
    state = TUTO_TELOP_DISAPP;
    //[self init_TUTO_TELOP_DISAPP];
	
	UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushHowToBoke:)];
	_howToBokeView.userInteractionEnabled = YES;
	[_howToBokeView addGestureRecognizer: recognizer];

}

/**
 * UIViewがタップされたときに呼ばれるメソッド
 */
- (void)pushHowToBoke:(UITapGestureRecognizer *)recognizer {
	
    //タップされた際のアクション
    NSLog(@"%@",recognizer);
	[self init_TUTO_TELOP_DISAPP];
}

// ???、「あなたならどうボケる？」を非表示
-(void) init_TUTO_TELOP_DISAPP
{
	NSLog(@"init_TUTO_TELOP_DISAPP");
	state = TUTO_TELOP_DISAPP;
	
	_bokeText1View.hidden = YES;
	_howToBokeView.hidden = YES;
	
	[self init_TUTO_BOKE_APP];
}

-(void) TUTO_BOKE_DISAPP_timer_func
{
	_bokeText1View.hidden = YES;
	_howToBokeView.hidden = YES;
	
	[self init_TUTO_BOKE_APP];
}

-(void) init_TUTO_BOKE_APP		    // ボケテキストの表示
{
	NSLog(@"init_TUTO_TELOP_DISAPP");
	state = TUTO_TELOP_DISAPP;
	
	_bokeText2View.hidden = NO;
	[NSTimer
     scheduledTimerWithTimeInterval:2.0f
     target:self
     selector:@selector(TUTO_BOKE_APP_timer_func)
     userInfo:nil
     repeats:NO
     ];
}

-(void) TUTO_BOKE_APP_timer_func
{
	[self init_TUTO_ZABUTON_APP];
}

-(void) init_TUTO_ZABUTON_APP       // 座布団、「座布団をタップしてみよう」の表示
{
	NSLog(@"init_TUTO_TELOP_DISAPP");
	state = TUTO_TELOP_DISAPP;
	
	[NSTimer
     scheduledTimerWithTimeInterval:1.0f
     target:self
     selector:@selector(TUTO_ZABUTON_APP_timer_func1)
     userInfo:nil
     repeats:NO
     ];
    
    // この画像、あなたならどうボケる？を表示
    _tm =
    [NSTimer
     scheduledTimerWithTimeInterval:2.0f
     target:self
     selector:@selector(TUTO_ZABUTON_APP_timer_func2)
     userInfo:nil
     repeats:NO
     ];
}

-(void) TUTO_ZABUTON_APP_timer_func1
{
	// 座布団表示
	_zabutonView.hidden = NO;
}

-(void) TUTO_ZABUTON_APP_timer_func2
{
	//「座布団をタップしてみよう」表示
	_letsTapView.hidden = NO;
	
	UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushZabuton:)];
	_zabutonView.userInteractionEnabled = YES;
	[_zabutonView addGestureRecognizer: recognizer];

	//[self init_TUTO_ZABUTON_WAIT];
}

/**
 * UIViewがタップされたときに呼ばれるメソッド
 */
- (void)pushZabuton:(UITapGestureRecognizer *)recognizer
{
	[self init_TUTO_ZABUTON_WAIT];
}

-(void) init_TUTO_ZABUTON_WAIT		// 座布団がタッチされるまでの待ち
{
	NSLog(@"init_TUTO_ZABUTON_WAIT");
	state = TUTO_TELOP_DISAPP;
	
	[NSTimer
     scheduledTimerWithTimeInterval:2.0f    // タイマーを発生させる間隔(秒)
     target:self                            // タイマー発生時に呼び出すメソッドがあるターゲット
     selector:@selector(TUTO_ZABUTON_WAIT_timer_func)        // タイマー発生時に呼び出すメソッド
     userInfo:nil                           // selectorで呼び出すメソッドに渡す情報(NSDictionary)
     repeats:NO                            // タイマーの実行を繰り返すかどうかの指定 （YES：繰り返す　NO：１回のみ）
     ];
}

-(void)TUTO_ZABUTON_WAIT_timer_func
{
	[self init_TUTO_ZABUTON_ANIM];
}

-(void) init_TUTO_ZABUTON_ANIM      // 座布団アニメーション
{
	NSLog(@"init_TUTO_ZABUTON_ANIM");
	state = TUTO_TELOP_DISAPP;

	[NSTimer
     scheduledTimerWithTimeInterval:2.0f    // タイマーを発生させる間隔(秒)
     target:self                            // タイマー発生時に呼び出すメソッドがあるターゲット
     selector:@selector(TUTO_ZABUTON_ANIM_timer_func)        // タイマー発生時に呼び出すメソッド
     userInfo:nil                           // selectorで呼び出すメソッドに渡す情報(NSDictionary)
     repeats:NO                            // タイマーの実行を繰り返すかどうかの指定 （YES：繰り返す　NO：１回のみ）
     ];
}

-(void) TUTO_ZABUTON_ANIM_timer_func
{
	[self init_TUTO_TELOP2_APP];
}

-(void) init_TUTO_TELOP2_APP        // 「気軽にボケられるよ」の表示
{
	NSLog(@"init_TUTO_TELOP2_APP");
	state = TUTO_TELOP_DISAPP;
	
	_balloneView.hidden = NO;
	[NSTimer
     scheduledTimerWithTimeInterval:1.0f    // タイマーを発生させる間隔(秒)
     target:self                            // タイマー発生時に呼び出すメソッドがあるターゲット
     selector:@selector(TUTO_TELOP2_APP_timer_func)        // タイマー発生時に呼び出すメソッド
     userInfo:nil                           // selectorで呼び出すメソッドに渡す情報(NSDictionary)
     repeats:NO                            // タイマーの実行を繰り返すかどうかの指定 （YES：繰り返す　NO：１回のみ）
     ];
}

-(void) TUTO_TELOP2_APP_timer_func
{
	[self init_TUTO_TELOP2_WAIT];
}

-(void) init_TUTO_TELOP2_WAIT       // 「気軽にボケられるよ」の待ち
{
	NSLog(@"init_TUTO_TELOP2_WAIT");
	state = TUTO_TELOP_DISAPP;
	
	[NSTimer
     scheduledTimerWithTimeInterval:1.0f    // タイマーを発生させる間隔(秒)
     target:self                            // タイマー発生時に呼び出すメソッドがあるターゲット
     selector:@selector(TUTO_TELOP2_WAIT_timer_func)        // タイマー発生時に呼び出すメソッド
     userInfo:nil                           // selectorで呼び出すメソッドに渡す情報(NSDictionary)
     repeats:NO                            // タイマーの実行を繰り返すかどうかの指定 （YES：繰り返す　NO：１回のみ）
     ];
}

-(void)TUTO_TELOP2_WAIT_timer_func
{
	[self init_TUTO_FADE_OUT_1];
}

// ボケ画面フェードアウト1
-(void) init_TUTO_FADE_OUT_1
{
	NSLog(@"init_TUTO_FADE_OUT_1");
	state = TUTO_TELOP_DISAPP;
	
	[UIView animateWithDuration:1.0f
			  delay:0.0
			options:UIViewAnimationOptionCurveLinear
		 animations:^(void){
			 _page1View.alpha = 0.0;
		 }
		 completion:^(BOOL finished){
			 [self init_TUTO_FADE_IN_2];
		 }];

	
}
-(void) init_TUTO_FADE_IN_2         // フェードイン2
{
	NSLog(@"init_TUTO_FADE_IN_2");
	state = TUTO_TELOP_DISAPP;
	
	_page1View.hidden = YES;
	_page2View.hidden = NO;
	_letsBokeView.hidden = YES;
	_buttonAreaView.hidden = YES;
	
	[NSTimer
     scheduledTimerWithTimeInterval:1.0f
     target:self
     selector:@selector(TUTO_FADE_IN_2_timer_func1)
     userInfo:nil
     repeats:NO
     ];
	
	[NSTimer
     scheduledTimerWithTimeInterval:2.0f
     target:self
     selector:@selector(TUTO_FADE_IN_2_timer_func2)
     userInfo:nil
     repeats:NO
     ];
}

-(void)TUTO_FADE_IN_2_timer_func1
{
	_letsBokeView.hidden = NO;
}

-(void)TUTO_FADE_IN_2_timer_func2
{
	_buttonAreaView.hidden = NO;
	[self init_TUTO_LAST_WAIT];
}


-(void) init_TUTO_LAST_WAIT			// ログインorスキップボタンが押されるのの待ち
{
	NSLog(@"init_TUTO_LAST_WAIT");
	state = TUTO_TELOP_DISAPP;
	
	
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

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


- (IBAction)pushLoginButton:(id)sender
{
	NSLog(@"pushLoginButton");
}

- (IBAction)pushSkipButton:(id)sender
{
	NSLog(@"pushSkipButton");
}

// タッチイベントを取る
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    UITouch *touch = [touches anyObject];
//    switch (touch.view.tag) {
//        case 1:
//            // タグが1のビュー
//			NSLog(@"ImageViewに触った");
//            break;
//        default:
//            // それ以外
//            NSLog(@"Viewに触った");
//            break;
//    }
//}

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
