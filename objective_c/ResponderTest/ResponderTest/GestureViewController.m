//
//  GestureViewController.m
//  ResponderTest
//
//  Created by B02681 on 2014/08/19.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import "GestureViewController.h"

@interface GestureViewController ()

@end

@implementation GestureViewController

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
    
    // シングルタップ
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    [self.view addGestureRecognizer:tapGesture];

    // ダブルタップ
    UITapGestureRecognizer* doubleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTapGesture:)];
    doubleTapGesture.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:doubleTapGesture];
    
    
    // 左へスワイプ
    UISwipeGestureRecognizer* swipeLeftGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeLeftGesture:)];
    swipeLeftGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeftGesture];
    
    // 右へスワイプ
    UISwipeGestureRecognizer* swipeRightGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeRightGesture:)];
    swipeRightGesture.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRightGesture];
    
    
    //---------------------------------------------
    // View1にジェスチャーをセット
    // シングルタップ
    UITapGestureRecognizer* tapGestureS1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    [_subview1 addGestureRecognizer:tapGestureS1];
    
    // 右へスワイプ
    UISwipeGestureRecognizer* swipeRightGestureS1 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeRightGesture:)];
    swipeRightGestureS1.direction = UISwipeGestureRecognizerDirectionRight;
    [_subview1 addGestureRecognizer:swipeRightGestureS1];

    
    // View2にジェスチャーをセット
    // シングルタップ
    UITapGestureRecognizer* tapGestureS2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    [_subview2 addGestureRecognizer:tapGestureS2];

    // View3にジェスチャーをセット
    // シングルタップ
    UITapGestureRecognizer* tapGestureS3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    [_subview3 addGestureRecognizer:tapGestureS3];
    
    
    
    // Do any additional setup after loading the view from its nib.
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark GestureFunctions
- (void) handleTapGesture:(UITapGestureRecognizer*)sender {
  NSLog(@"tap %d", sender.view.tag);
}

- (void) handleDoubleTapGesture:(UITapGestureRecognizer*)sender {
  NSLog(@"double tap %d", sender.view.tag);
}


- (void) handleSwipeLeftGesture:(UISwipeGestureRecognizer *)sender {
  NSLog(@"swipe left %d", sender.view.tag);
}
- (void) handleSwipeRightGesture:(UISwipeGestureRecognizer *)sender {
  NSLog(@"swipe right %d", sender.view.tag);
}

@end
