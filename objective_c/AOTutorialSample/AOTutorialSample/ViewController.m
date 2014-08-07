//
//  ViewController.m
//  AOTutorialSample
//
//  Created by B02681 on 2014/08/07.
//  Copyright (c) 2014年 B02681. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
{
//	UIView *_page1View;
//	UIView *_page2View;
//	UIView *_bokeBGView;
//	UIImageView *_bokeImgView;
//	NSMutableArray *_imageViewList;
}

@end

@implementation ViewController

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
	
	CGRect rect = [[UIScreen mainScreen] bounds];
	
	_page1View.frame = CGRectMake(0, 20, rect.size.width, rect.size.height);
	[self.view addSubview:_page1View];
	
#if 0
	// UIViewを作成
	_page1View = [[UIView alloc]initWithFrame:CGRectMake(0, 20, screen_size.size.width, screen_size.size.height - 20)];
	_page2View = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screen_size.size.width, screen_size.size.height)];
	// ボケエリアのView
	_bokeBGView = [[UIView alloc]initWithFrame:CGRectMake(18, 35, 284, 350)];
	_bokeBGView.backgroundColor = [UIColor blackColor];
	_bokeBGView.layer.cornerRadius = 5;
	_bokeBGView.clipsToBounds = true;
	
	[self.view addSubview:_page1View];
	[_page1View addSubview:_bokeBGView];
	

//	UIImageView *bokeImgView;
//	NSArray *imageViewList;
//	NSArray *zabutonImgList;

	// UIImageViewを作成
	NSArray *imgNameList = @[@{@"name" : @"image/boke_obi.png", @"x" : @"10", @"y" : @"20"},\
							 @{@"name" : @"image/boke_photo.png", @"x" : @"10", @"y" : @"20"},\
							 @{@"name" : @"image/boke_text_cardboard-568.png", @"x" : @"10", @"y" : @"20"},\
							 @{@"name" : @"image/boke_text_hatena.png", @"x" : @"10", @"y" : @"20"},\
							 @{@"name" : @"image/boke_text_how.png", @"x" : @"10", @"y" : @"20"},\
							 @{@"name" : @"image/boke_text_tapzabuton.png", @"x" : @"10", @"y" : @"20"},\
							 @{@"name" : @"image/boke_yubi_big.png", @"x" : @"10", @"y" : @"20"},\
							 @{@"name" : @"image/zabuton_0", @"x" : @"10", @"y" : @"20"},\
							 @{@"name" : @"image/zabuton_1", @"x" : @"10", @"y" : @"20"},\
							 @{@"name" : @"image/zabuton_2", @"x" : @"10", @"y" : @"20"},\
							 @{@"name" : @"image/zabuton_3", @"x" : @"10", @"y" : @"20"},\
							 @{@"name" : @"image/zabuton_star_small.png", @"x" : @"10", @"y" : @"20"},\
							 @{@"name" : @"image/zabuton_star_big.png", @"x" : @"10", @"y" : @"20"},\
							 @{@"name" : @"image/zabuton_star_left.png", @"x" : @"10", @"y" : @"20"},\
							 @{@"name" : @"image/zabuton_star_right.png", @"x" : @"10", @"y" : @"20"},\
							 @{@"name" : @"image/zabuton_text_0.png", @"x" : @"10", @"y" : @"20"},\
							 @{@"name" : @"image/zabuton_text_1.png", @"x" : @"10", @"y" : @"20"},\
							 @{@"name" : @"image/zabuton_text_2.png", @"x" : @"10", @"y" : @"20"},\
							 @{@"name" : @"image/login_logo_pigg-568.png", @"x" : @"10", @"y" : @"20"},\
							 @{@"name" : @"image/login_text_caution.png", @"x" : @"10", @"y" : @"20"},\
							 @{@"name" : @"image/login_icon_sns.png", @"x" : @"10", @"y" : @"20"},\
							 @{@"name" : @"image/login_button_start_on-568.png", @"x" : @"10", @"y" : @"20"},\
							 @{@"name" : @"image/login_button_start_568.png", @"x" : @"10", @"y" : @"20"},\
							 @{@"name" : @"image/boke_obi.png", @"x" : @"10", @"y" : @"20"},\
							 @{@"name" : @"image/boke_obi.png", @"x" : @"10", @"y" : @"20"},\
							 @{@"name" : @"image/boke_obi.png", @"x" : @"10", @"y" : @"20"}];
	_imageViewList = [[NSMutableArray alloc]init];
	for(NSString *name in imgNameList){
		UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:name]];
		[_imageViewList addObject:imageView];
	}
	// 初期表自分のレイアウトを作成する
	[_page1View addSubview: [_imageViewList objectAtIndex:IMG_TOP_BAR]];
	
	UIImageView *imageView = (UIImageView*)[_imageViewList objectAtIndex:IMG_BOKE];
	CGRect rect = imageView.frame;
	imageView.frame = CGRectMake(25, 20, rect.size.width, rect.size.height);
	[_bokeBGView addSubview: imageView];
#endif 
//	IMG_BOKE,
//	IMG_BOKE_TXT_1,		// ???
//	IMG_BOKE_TXT_2,		// ダンボールだけ〜
//	IMG_TELOP_1,		// この画像、あなたならどうボケる？？
//	IMG_TELOP_2,		// 座布団をタップしてみよう
	 
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

@end
