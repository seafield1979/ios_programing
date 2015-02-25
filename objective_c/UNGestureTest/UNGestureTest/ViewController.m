//
//  ViewController.m
//  UNGestureTest
//
//  Created by B02681 on 2014/09/26.
//  Copyright (c) 2014年 B02681. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self initPanGesture];
//    [self initTapGesture];
//    [self initPinchGesture];
//    [self initRotateGesture];
    [self initSwipeGesture];
    [self initLongPressGesture: 1.0 allowableMovement:30];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private method

/*
 * パンジェスチャーを作成
 */
-(void)initPanGesture
{
    // Add pan gesture
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(gestureFunc1:)];
    [self.view addGestureRecognizer:panGesture];
}

/*
 * タップジェスチャーを初期化
 */
-(void)initTapGesture
{
    // シングルタップ
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    [self.view addGestureRecognizer:tapGesture];

    // ダブルタップ
    UITapGestureRecognizer* doubleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTapGesture:)];
    doubleTapGesture.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:doubleTapGesture];
    
}

/*
 * ピンチジェスチャーを初期化
 */
-(void)initPinchGesture
{
    UIPinchGestureRecognizer* pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinchGesture:)];
    [self.view addGestureRecognizer:pinchGesture];
}

/*
 * ローテートジェスチャーを初期化
 */
-(void)initRotateGesture
{
    UIRotationGestureRecognizer* rotationGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotationGesture:)];
    [self.view addGestureRecognizer:rotationGesture];
}

/*
 * ロングプレスジェスチャーを初期化
 * @param duration  ログンプレスを認識するまでの時間(秒)
 * @param movement  長押し中に移動しても許容されるピクセル
 */
-(void)initLongPressGesture:(CFTimeInterval)duration allowableMovement:(CGFloat)movement
{
    UILongPressGestureRecognizer* longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPressGesture:)];
    longPressGesture.minimumPressDuration = duration;
    longPressGesture.allowableMovement = movement;
    [self.view addGestureRecognizer:longPressGesture];
}

/*
 * スワイプ
 */
-(void)initSwipeGesture
{
    // 左スワイプ
    UISwipeGestureRecognizer* leftSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeGesture:)];
    
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:leftSwipe];
}

#pragma mark - Gesture method


- (void) handleTapGesture:(UITapGestureRecognizer*)sender {
    NSLog(@"tap");
}

- (void) handleDoubleTapGesture:(UITapGestureRecognizer*)sender {
    NSLog(@"double tap");
}
/*
 * パン（引っぱる）ジェスチャー
 */
- (void)gestureFunc1:(UIPanGestureRecognizer *)panGesture {
    CGPoint movePoint = [panGesture translationInView:self.view];
    NSLog(@"pan x:%f y:%f", movePoint.x, movePoint.y);
    
    // Reset
    [panGesture setTranslation:CGPointZero inView:self.view];
}

/*
 * ピンチ（拡大縮小）ジェスチャー
 */
- (void) handlePinchGesture:(UIPinchGestureRecognizer*) sender {
    UIPinchGestureRecognizer* pinch = (UIPinchGestureRecognizer*)sender;
    NSLog(@"pinch scale=%f, velocity=%f", pinch.scale, pinch.velocity);
}

/*
 * ローテートジェスチャー
 */
- (void) handleRotationGesture:(UIRotationGestureRecognizer*) sender {
    UIRotationGestureRecognizer* rotation = (UIRotationGestureRecognizer*) sender;
    NSLog(@"rotation rad=%f, velocity=%f", rotation.rotation, rotation.velocity);
}

/*
 * ロングプレス
 */
- (void) handleLongPressGesture:(UILongPressGestureRecognizer*) sender {
    if (sender.state == UIGestureRecognizerStateEnded) {
        NSLog(@"longpress release");
        //Do Whatever You want on End of Gesture
    }
    else if (sender.state == UIGestureRecognizerStateBegan){
        NSLog(@"longpress");
        //Do Whatever You want on Began of Gesture
    }
}

/*
 * 左スワイプ
 */
- (void) handleSwipeGesture:(UISwipeGestureRecognizer*)sender {
    NSLog(@"swipe left");
}

@end
