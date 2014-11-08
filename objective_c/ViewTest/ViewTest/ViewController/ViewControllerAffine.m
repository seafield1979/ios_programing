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
    if (self.transformSegment.selectedSegmentIndex == 0){
        // 新しくtranformを変換を作成する
        [UIView animateWithDuration:1.0 animations:^(){
            CGFloat angle = 30.0 * M_PI / 180.0;
            self.imageView1.transform = CGAffineTransformMakeRotation(angle);
        }];
    }
    else{
        // 現在のtransformに加算する
        [UIView animateWithDuration:1.0 animations:^(){
            CGFloat angle = 30.0 * M_PI / 180.0;
            self.imageView1.transform = CGAffineTransformRotate(self.imageView1.transform, angle);
        }];
    }
}
@end
