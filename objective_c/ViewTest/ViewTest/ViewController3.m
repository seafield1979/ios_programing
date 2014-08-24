//
//  ViewController3.m
//  ViewTest
//
//  Created by B02681 on 2014/08/08.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//
/**
  UIViewの変形のサンプル
  拡大
  縮小
 
 */

#import "ViewController3.h"

@interface ViewController3 ()
{
	
}
@end

@implementation ViewController3

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

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
	
}

#pragma mark _IBActionFunc

/*
 * Viewを拡大する
 */
-(IBAction)pushButton1:(id)sender
{
	NSLog(@"pushButton1");

	CGRect rect1 = _imageView1.frame;
	
	[UIView animateWithDuration:1.0f
					 animations:^{
						 //拡大
						 float width = rect1.size.width * 1.5;
						 float height = rect1.size.height * 1.5;
						 _imageView1.frame = CGRectMake(rect1.origin.x + rect1.size.width / 2 - width / 2,
														rect1.origin.y + rect1.size.height / 2 - height / 2, width, height);
					 }
					 completion:^(BOOL finished){
						 NSLog(@"finish amimation");
					 }];
	
//	CGAffineTransform t, t2, t3;
#if 0
	[UIView animateWithDuration:1.0f
					 animations:^{
						 //拡大
						 CGAffineTransform t;
						 t = CGAffineTransformMakeScale(1.5, 1.5);
						 _imageView1.layer.anchorPoint = CGPointMake(0.75, 0.75);
						 [_imageView1 setTransform:t];
					 }
					 completion:^(BOOL finished){
						 NSLog(@"finish amimation");
					 }];
	
#endif
#if 0
	t = CGAffineTransformMakeScale(1.5, 1.5);
	t2 = CGAffineTransformMakeTranslation(-50, -50);
	t3 = CGAffineTransformConcat(t, t2);
	[_imageView1 setTransform:t3];

#endif
#if 0
	[UIView animateWithDuration:1.0f
		 animations:^{
			 //拡大
			 CGAffineTransform t, t2, t3;
			 t = CGAffineTransformMakeScale(1.5, 1.5);
			 t2 = CGAffineTransformMakeTranslation(-50, -50);
			 t3 = CGAffineTransformConcat(t, t2);
			 [_imageView1 setTransform:t3];
		 }
		 completion:^(BOOL finished){
			 NSLog(@"finish amimation");
		 }];

#endif
#if 0
	//平行移動
	t = CGAffineTransformMakeTranslation(100.0, 100.0);
	[_imageView1 setTransform:t];
#endif
	
	NSLog(@"%f %f %f %f", _imageView1.frame.origin.x, _imageView1.frame.origin.y, _imageView1.frame.size.width, _imageView1.frame.size.height);
}

/*
 * Viewを縮小する
 */
-(IBAction)pushButton2:(id)sender
{
	NSLog(@"pushButton2");

	NSLog(@"pushButton1");

	CGRect rect1 = _imageView1.frame;

	[UIView animateWithDuration:1.0f
					 animations:^{
						 //拡大
						 float width = rect1.size.width * 0.75;
						 float height = rect1.size.height * 0.75;
						 _imageView1.frame = CGRectMake(rect1.origin.x + rect1.size.width / 2 - width / 2,
														rect1.origin.y + rect1.size.height / 2 - height / 2, width, height);
					 }
					 completion:^(BOOL finished){
						 NSLog(@"finish amimation");
					 }];


}


/*
 * 右に回転する
 */
-(IBAction)pushButton3:(id)sender
{
	NSLog(@"pushButton3");
    //todo
}

/*
 * 左に回転する
 */
-(IBAction)pushButton4:(id)sender
{
	NSLog(@"pushButton4");
    //todo
}



@end
