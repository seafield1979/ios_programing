//
//  ViewController.m
//  
//
//  Created by 海野 秀祐 on 2014/08/04.
//
//

#import "ViewController.h"

@interface ViewController ()
{
	int showView;
	int imageView;
	UIView *_view1;
	UIView *_view2;
	UIView *_imgView1;
	UIView *_imgView2;
}
@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		showView = 1;
		_view1 = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
		_view1.backgroundColor = [UIColor redColor];
		_view1.alpha = 1.0;

		_view2 = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
		_view2.backgroundColor = [UIColor blueColor];
		_view2.alpha = 0.0;
		
		imageView = 1;
		UIImage *image1 = [UIImage imageNamed:@"Image/loading_01.png"];
		_imgView1 = [[UIView alloc]initWithFrame:CGRectMake(200, 100, 56, 56)];
		_imgView1.backgroundColor = [UIColor colorWithPatternImage:image1];
		_imgView1.alpha = 1.0;
		
		UIImage *image2 = [UIImage imageNamed:@"Image/loading_02.png"];
		_imgView2 = [[UIView alloc]initWithFrame:CGRectMake(200, 100, 56, 56)];
		_imgView2.backgroundColor = [UIColor colorWithPatternImage:image2];
		_imgView2.alpha = 0.0;
		
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
			 }];
	}
	else{
		showView = 0;
		[UIView animateWithDuration:1.0f
						 animations:^{
							 // アニメーションをする処理
							 _view1.alpha = 0.0;
							 _view2.alpha = 1.0;
						 }];

	}
}

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

@end
