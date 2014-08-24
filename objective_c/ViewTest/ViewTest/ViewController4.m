//
//  ViewController4.m
//  ViewTest
//
//  Created by UnnoShusuke on 2014/08/25.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import "ViewController4.h"

@interface ViewController4 ()

@end

@implementation ViewController4

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

#pragma mark - Action method


// image1をimage2にコピーする
- (IBAction)copyButtonDidTap:(id)sender
{
#if 0
    UIGraphicsBeginImageContext(CGSizeMake(_imageView1.frame.size.width, _imageView1.frame.size.height));
#else
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(_imageView1.frame.size.width, _imageView1.frame.size.height), NO, 0.0);
#endif
    //イメージ用グラフィックスコンテクスト取得
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 背景
//    CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 1.0);
//    CGContextFillRect(context, CGRectMake(0, 0, _imageView1.frame.size.width, _imageView1.frame.size.height));
//    
    [_imageView1.image drawInRect:CGRectMake(0, 0, _imageView1.frame.size.width, _imageView1.frame.size.height)];
    UIImage *image2 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    _imageView2.image = image2;
    

}
@end
