//
//  ViewControllerAffine.m
//  ViewTest
//
//  Created by UnnoShusuke on 2014/11/08.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import "ViewControllerAffine.h"

@interface ViewControllerAffine ()

@end

@implementation ViewControllerAffine

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 回転軸を変更する
    // http://d.hatena.ne.jp/shobonengine/20110517/1305618891
    self.baseImageView2.layer.anchorPoint = CGPointMake(0, 1);
    
    CGRect tempFrame = self.baseImageView2.frame;
    tempFrame.origin.x -= tempFrame.size.width / 2;
    tempFrame.origin.y += tempFrame.size.height / 2;
    self.baseImageView2.frame = tempFrame;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Private method

- (void)scaleImageView1:(CGFloat)scale
{
    if (self.transformSegment.selectedSegmentIndex == 0){
        // 新しくtranformを変換を作成する
        [UIView animateWithDuration:1.0 animations:^(){
            self.imageView1.transform = CGAffineTransformMakeScale(scale, scale);
        }];
    }
    else{
        // 現在のtransformに加算する
        [UIView animateWithDuration:1.0 animations:^(){
            self.imageView1.transform = CGAffineTransformScale(self.imageView1.transform, scale, scale);
        }];
    }
}

#pragma mark - Action method

/*
 * 移動ボタンタップ
 */
- (IBAction)translateButtonDidTap:(id)sender {
    
    if (self.transformSegment.selectedSegmentIndex == 0){
        // 新しくtranformを変換を作成する
        [UIView animateWithDuration:1.0 animations:^(){
            self.imageView1.transform = CGAffineTransformMakeTranslation(50, 50);
        }];
    }
    else{
        // 現在のtransformに加算する
        [UIView animateWithDuration:1.0 animations:^(){
            self.imageView1.transform = CGAffineTransformTranslate(self.imageView1.transform, 50, 50);
        }];
    }
}

/*
 * 拡大ボタンタップ
 */
- (IBAction)scaleUpButtonDidTap:(id)sender {
    [self scaleImageView1:1.5];
}

/*
 * 縮小ボタンタップ
 */
- (IBAction)scaleDownButtonDidTap:(id)sender {
    [self scaleImageView1:0.7];
}

/*
 * 回転ボタンタップ
 */
- (IBAction)rotateButtonDidTap:(id)sender {
    CGFloat rot = (self.rotDirectionSegment.selectedSegmentIndex == 0) ? 90.0 : -90.0;
    [self rotateView:self.imageView1 angle:rot time:0.7];
}

/*
 * 回転ボタンタップ
 */
- (IBAction)rotateButton2DidTap:(id)sender {
    CGFloat rot = (self.rotDirectionSegment.selectedSegmentIndex == 0) ? 90.0 : -90.0;
    
    [self rotateView:self.baseImageView2 angle:rot time:0.7];
}

#pragma mark - Private method

/*
 * Viewを回転する
 */
- (void)rotateView:(UIView*)view angle:(CGFloat)angle time:(CGFloat)time
{
    if (self.transformSegment.selectedSegmentIndex == 0){
        // 新しくtranformを変換を作成する
        [UIView animateWithDuration:time animations:^(){
            CGFloat rot = angle * M_PI / 180.0;
            view.transform = CGAffineTransformMakeRotation(rot);
        }];
    }
    else{
        // 現在のtransformに加算する
        [UIView animateWithDuration:time animations:^(){
            CGFloat rot = angle * M_PI / 180.0;
            view.transform = CGAffineTransformRotate(view.transform, rot);
        }];
    }
}

@end
