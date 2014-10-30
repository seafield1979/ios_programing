//
//  ViewController.m
//  
//
//  Created by 海野 秀祐 on 2014/08/04.
//
//
/**
 サンプルの内容
 UIViewの生成
 UIImageViewの生成
 UIViewのアニメーション(アルファ)
 UIViewの表示優先度の設定(bringSubviewToFront)
 UIViewのタッチ(ジェスチャー)
 UIViewのタッチ(UIResponderのオーバーライド) 
 
 */

#import "ViewController.h"

@interface ViewController ()
{
	int showView;
	int imageView;
	int priorityView;
	
}
@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		showView = 1;
		self.view1 = [[UIView alloc]initWithFrame:CGRectMake(50, 70, 50, 50)];
		self.view1.backgroundColor = [UIColor redColor];
		self.view1.alpha = 1.0;

		self.view2 = [[UIView alloc]initWithFrame:CGRectMake(50, 70, 50, 50)];
		self.view2.backgroundColor = [UIColor blueColor];
		self.view2.alpha = 0.0;
		
		imageView = 1;
		UIImage *image1 = [UIImage imageNamed:@"loading_01.png"];
		self.imgView1 = [[UIView alloc]initWithFrame:CGRectMake(150, 70, 56, 56)];
		self.imgView1.backgroundColor = [UIColor colorWithPatternImage:image1];
		self.imgView1.alpha = 1.0;
		
		UIImage *image2 = [UIImage imageNamed:@"loading_02.png"];
		self.imgView2 = [[UIView alloc]initWithFrame:CGRectMake(150, 70, 56, 56)];
		self.imgView2.backgroundColor = [UIColor colorWithPatternImage:image2];
		self.imgView2.alpha = 0.0;
		
		// 表示優先度テスト用
		priorityView = 0;
		self.priView1 = [[UIView alloc]initWithFrame:CGRectMake(100, 200, 100, 50)];
		self.priView1.backgroundColor = [UIColor redColor];
		
		self.priView2 = [[UIView alloc]initWithFrame:CGRectMake(150, 200, 100, 50)];
		self.priView2.backgroundColor = [UIColor blueColor];
		
		
		// タッチ、タップテスト
		_tapView = [[UIView alloc] initWithFrame:CGRectMake(100, 250, 50, 50)];
		_tapView.backgroundColor = [UIColor orangeColor];
		
		
		// タッチできるUIView
		UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapped:)];
        _tapView.userInteractionEnabled = YES;
		[_tapView addGestureRecognizer: recognizer];
		[self.view addSubview:_tapView];
		
		UILabel *labelTouch = [[UILabel alloc] initWithFrame:CGRectMake(20, 250, 80, 30)];
		labelTouch.text = @"touch -> ";
		[self.view addSubview:labelTouch];

		// タッチできるUIView 2
		self.myTouchView = [[MyTouchView alloc] initWithFrame:CGRectMake(200, 250, 50, 50)];
		self.myTouchView.backgroundColor = [UIColor purpleColor];
		[self.view addSubview: self.myTouchView];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	[self.view addSubview:_view1];
	[self.view addSubview:_view2];
	[self.view addSubview:_imgView1];
	[self.view addSubview:_imgView2];
	[self.view addSubview:_priView1];
	[self.view addSubview:_priView2];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushButton1:(id)sender
{
	NSLog(@"pushButton1");
	if(showView == 0){
		showView = 1;
		[UIView animateWithDuration:1.0f
			 animations:^{
				 // アニメーションをする処理
				 _view1.alpha = 1.0;
				 _view2.alpha = 0.0;
			 }
			 completion:^(BOOL finished){
				NSLog(@"finish amimation");
			 }];
	}
	else{
		showView = 0;
		[UIView animateWithDuration:1.0f
						 animations:^{
							 // アニメーションをする処理
							 _view1.alpha = 0.0;
							 _view2.alpha = 1.0;
						 }
						 completion:^(BOOL finished){
							 NSLog(@"finish amimation");
						 }];

	}
}

//imgView1,imgView2のアルファ値をアニメーションで切り替える
- (IBAction)pushButton2:(id)sender
{
	NSLog(@"pushButton2");
	if(imageView == 0){
		imageView = 1;
		[UIView animateWithDuration:1.0f
						 animations:^{
							 // アニメーションをする処理
							 _imgView1.alpha = 1.0;
							 _imgView2.alpha = 0.0;
						 }];
	}
	else{
		imageView = 0;
		[UIView animateWithDuration:1.0f
						 animations:^{
							 // アニメーションをする処理
							 _imgView1.alpha = 0.0;
							 _imgView2.alpha = 1.0;
						 }];
	}
}


/*
 * Viewの表示優先度を変更する
 */
- (IBAction)pushButton3:(id)sender
{
	NSLog(@"pushButton3");
	if(priorityView == 0){
		priorityView = 1;
		[self.view bringSubviewToFront:_priView1];
	}
	else{
		priorityView = 0;
		[self.view bringSubviewToFront:_priView2];
	}
}

/*
 * 表示するviewを切り替える
 */
- (IBAction)pushChangeViewButton:(id)sender {
//    self.baseView1.hidden = YES;
    
    [self.view addSubview:self.baseView2];
}

/*
 *
 */
- (IBAction)pushShowView2Button:(id)sender {
    [self.baseView2 removeFromSuperview];
}

/**
 * UIViewがタップされたときに呼ばれるメソッド
 */
- (void)onTapped:(UITapGestureRecognizer *)recognizer {
	
    //タップされた際のアクション
    NSLog(@"%@",recognizer);
}


@end


@interface MyTouchView ()
@end

@implementation MyTouchView

/**
 * タッチされたとき
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // タッチされたときの処理
	NSLog(@"touchesBegan");
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	NSLog(@"touchesEnded");
}

@end