//
//  ViewController4.m
//  ViewTest
//
//  Created by UnnoShusuke on 2014/08/25.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//
/*
 UIGraphicsBeginImageContextWithOptions  仮想的な描画エリアを作成
 
 
 */

#import "ViewController4.h"

@interface ViewController4 ()
{
    int selectedSegment;
}

@end

@implementation ViewController4

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        selectedSegment = 0;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _imageView1.hidden = YES;
    //セグメント値が変更された時にhogeメソッドを呼び出す
    [_segment1 addTarget:self action:@selector(segment1Changed:)
        forControlEvents:UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Public method
-(UIImageView*)srcImage
{
    return (selectedSegment == 0) ? _imageView12 : _imageView1;
}


#pragma mark - Private method


#pragma mark - Action method


// image1をimage2にコピーする
- (IBAction)copyButtonDidTap:(id)sender
{
    UIImageView *image = [self srcImage];
#if 0
    UIGraphicsBeginImageContext(CGSizeMake(image.frame.size.width, image.frame.size.height));
#else
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(image.frame.size.width, image.frame.size.height), NO, 0.0);
#endif
    //イメージ用グラフィックスコンテクスト取得
//    CGContextRef context = UIGraphicsGetCurrentContext();
    
    _imageView2.frame = CGRectMake(_imageView2.frame.origin.x,
                                   _imageView2.frame.origin.y,
                                   image.frame.size.width,
                                   image.frame.size.height);
    
    [image.image drawInRect:CGRectMake(0, 0, image.frame.size.width, image.frame.size.height)];
    UIImage *image2 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    _imageView2.image = image2;
    

}

// 拡大コピー
- (IBAction)bigButtonDidTap:(id)sender
{
    UIImageView *image = [self srcImage];
#if 0
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(image.frame.size.width, image.frame.size.height), NO, 0.0);
    
    _imageView2.frame = CGRectMake(_imageView2.frame.origin.x,
                                   _imageView2.frame.origin.y,
                                   image.frame.size.width,
                                   image.frame.size.height);
    
    [image.image drawInRect:CGRectMake(0, 0,
                                             image.frame.size.width * 2,
                                             image.frame.size.height * 2)];
    UIImage *image2 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    _imageView2.image = image2;
#else
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(
                image.frame.size.width / 2, image.frame.size.height / 2), NO, 0.0);
    
    _imageView2.frame = CGRectMake(_imageView2.frame.origin.x,
                                   _imageView2.frame.origin.y,
                                   image.frame.size.width,
                                   image.frame.size.height);
    
    [image.image drawInRect:CGRectMake(0, 0,
                                             image.frame.size.width,
                                             image.frame.size.height)];
    UIImage *image2 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    _imageView2.image = image2;
#endif
}

// 縮小コピー
- (IBAction)smallButtonDidTap:(id)sender {
    UIImageView *image = [self srcImage];
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(image.frame.size.width, image.frame.size.height), NO, 0.0);

    _imageView2.frame = CGRectMake(_imageView2.frame.origin.x,
                                   _imageView2.frame.origin.y,
                                   image.frame.size.width,
                                   image.frame.size.height);
    
    [image.image drawInRect:CGRectMake(0, 0,
                                             image.frame.size.width / 2,
                                             image.frame.size.height / 2)];
    UIImage *image2 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    _imageView2.image = image2;
}

// image1の中央部分をimage2に切り出しコピー
- (IBAction)trim1ButtonDidTap:(id)sender {
    UIImageView *image = [self srcImage];
    // 中央部分を切り出す
    CGSize img1Size = image.frame.size;
    CGRect dstRect;
    if(img1Size.width > img1Size.height){
        // 横長
        dstRect.origin.x = (img1Size.height - img1Size.width) / 2;
        dstRect.origin.y = 0;
        dstRect.size.width = img1Size.width;
        dstRect.size.height = img1Size.height;

        UIGraphicsBeginImageContextWithOptions(CGSizeMake(img1Size.height, img1Size.height), NO, 0.0);
    }
    else{
        // 縦長
        dstRect.origin.x = 0;
        dstRect.origin.y = (img1Size.width - img1Size.height) / 2;
        dstRect.size.width = img1Size.width;
        dstRect.size.height = img1Size.height;
        
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(img1Size.width, img1Size.width), NO, 0.0);
    }
    
    _imageView2.frame = CGRectMake(_imageView2.frame.origin.x,
                                   _imageView2.frame.origin.y,
                                   200,
                                   200);
    
    [image.image drawInRect:dstRect];
    UIImage *image2 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    _imageView2.image = image2;
}


// image1の全体が収まるようにimage2にコピー
- (IBAction)trim2ButtonDidTap:(id)sender {
    UIImageView *image = [self srcImage];

    // 中央部分を切り出す
    CGSize img1Size = image.frame.size;
    CGRect dstRect;
    if(img1Size.width > img1Size.height){
        // 横長  いろいろ面倒なんだ
        dstRect.size.width = img1Size.height;
        dstRect.size.height = img1Size.height * (dstRect.size.width / img1Size.width);
        dstRect.origin.x = 0;
        dstRect.origin.y = (img1Size.height - dstRect.size.height) / 2;
        
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(img1Size.height, img1Size.height), NO, 0.0);
    }
    else{
        // 縦長
        dstRect.size.height = img1Size.width;
        dstRect.size.width = img1Size.width * (dstRect.size.height / img1Size.height);
        dstRect.origin.x = (img1Size.width - dstRect.size.width) / 2;
        dstRect.origin.y = 0;
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(img1Size.width, img1Size.width), NO, 0.0);
    }
    
    _imageView2.frame = CGRectMake(_imageView2.frame.origin.x,
                                   _imageView2.frame.origin.y,
                                   200,
                                   200);
    // 背景を黒で塗る
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 1.0);
    CGContextFillRect(context, CGRectMake(0, 0, 200, 200));

    
    [image.image drawInRect:dstRect];
    UIImage *image2 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    _imageView2.image = image2;
}

- (void)segment1Changed:(UISegmentedControl*)segment
{
    if(segment.selectedSegmentIndex == 0){
        selectedSegment = 0;
        _imageView1.hidden = YES;
        _imageView12.hidden = NO;
    }
    else{
        selectedSegment = 1;
        _imageView1.hidden = NO;
        _imageView12.hidden = YES;
    }
}

@end
