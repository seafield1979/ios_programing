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
#import "PRTween.h"
#import "UNButton.h"

@interface ViewController3 ()
{
	PRTweenOperation *activeTweenOperation;
}
@property (nonatomic, strong) UNButton *button1;
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
    
    //ボタン追加
    self.button1 = [[UNButton alloc]initWithFrame:CGRectMake(100.0, 350.0, 93.0, 72.0)];
    self.button1.endAnimatedCompletion = ^(void){
        NSLog(@"end animation");
    };
    [self.view addSubview:self.button1];

#if 0
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(200, 350, 93, 72)];
    view1.backgroundColor = [UIColor redColor];
    view1.hidden = NO;
    [self.button1.superview addSubview:view1];
#endif
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
#if 0
    // 線形
    [self.imageView1 animateWithScale:2.0];
#else

    [self.imageView1 scaleBoundWithScale:1.0 delay:0.0 duration:1.0 completion:^(void){}];
#endif
}

/*
 * Viewを縮小する
 */
-(IBAction)pushButton2:(id)sender
{
    [self.imageView1 scaleLinerWithStartValue:0.0 endValue:1.0 duration:1.0 completion:^(void){}];
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

/*
 * 点滅する
 */
- (IBAction)pushBlinkButton:(id)sender {
//    [self.imageView1 blinkWithInterval:0.5];
    [self.imageView1 startBlinkAlphaWithInterval:0.5];
}

/*
 * 移動する
 */
- (IBAction)pushMoveButton:(id)sender {
    [self.imageView1 startShakeYWithDelay:0.0 moveX:0.0 moveY:20.0];
}

/*
 * 座布団ボタンを押した
 */
- (IBAction)pushZabutonButton:(id)sender {
    UIButton *button = self.zabutonButton;//(UIButton*)sender;
    button.frame = CGRectMake(button.frame.origin.x, button.frame.origin.y,
                              200, 200);
    
}



@end
