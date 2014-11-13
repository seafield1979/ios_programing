//
//  ViewController4.m
//  ViewTest
//
//  Created by UnnoShusuke on 2014/08/25.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//
/*
 イメージコンテキストを使用した画像のコピー、拡大縮小
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

#pragma mark - Life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.imageView1.hidden = YES;
    //セグメント値が変更された時にhogeメソッドを呼び出す
    [self.segment1 addTarget:self action:@selector(segment1Changed:)
        forControlEvents:UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Public method
-(UIImageView*)srcImage
{
    return (selectedSegment == 0) ? self.imageView12 : self.imageView1;
}


#pragma mark - Private method

- (UIImage*)resizedImage:(UIImage*)img width:(CGFloat)width height:(CGFloat)height
{
    CGFloat width_ratio  = width  / img.size.width;
    CGFloat height_ratio = height / img.size.height;
    CGFloat ratio = (width_ratio < height_ratio) ? width_ratio : height_ratio;
    CGSize resized_size = CGSizeMake(img.size.width*ratio, img.size.height*ratio);
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(width, height), NO, [[UIScreen mainScreen] scale]);
    
    [img drawInRect:CGRectMake(0, 0, resized_size.width, resized_size.height)];
    UIImage* resized_image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resized_image;
}

#pragma mark - Action method


// image1をimage2にコピーする
// ※image1とimage2の縦横比を考慮しないのでアスペクト比が崩れる
- (IBAction)copyButtonDidTap:(id)sender
{
    UIImageView *srcImageView = [self srcImage];
    
    CGRect rect = self.imageView2.frame;
    UIImage *image = [self resizedImage:srcImageView.image
                                  width:srcImageView.frame.size.width
                                 height:srcImageView.frame.size.height];
    self.imageView2 = [[UIImageView alloc]initWithImage:image];
    self.imageView2.frame = CGRectMake(rect.origin.x, rect.origin.y,
                                       self.imageView2.frame.size.width,
                                       self.imageView2.frame.size.height);
    [self.view addSubview:self.imageView2];
    
    
}

// 拡大コピー
//
- (IBAction)bigButtonDidTap:(id)sender
{
#if 1
    UIImageView *srcImageView = [self srcImage];
    
    CGRect rect = self.imageView2.frame;
    UIImage *image = [self resizedImage:srcImageView.image
                                  width:srcImageView.frame.size.width * 2
                                 height:srcImageView.frame.size.height * 2];
    self.imageView2 = [[UIImageView alloc]initWithImage:image];
    self.imageView2.frame = CGRectMake(rect.origin.x, rect.origin.y,
                                       self.imageView2.frame.size.width,
                                       self.imageView2.frame.size.height);
    [self.view addSubview:self.imageView2];

#else
    UIImageView *image = [self srcImage];
    
    // 1.コンテキスト作成 srcImageのサイズ
    // イメージコンテキスト作成
    if (UIGraphicsBeginImageContextWithOptions != NULL) {
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(image.frame.size.width / 2, image.frame.size.height / 2), NO, [[UIScreen mainScreen] scale]);
    } else {
        UIGraphicsBeginImageContext(CGSizeMake(image.frame.size.width / 2, image.frame.size.height / 2));
    }

//    UIGraphicsBeginImageContextWithOptions(CGSizeMake(image.frame.size.width / 2, image.frame.size.height / 2), NO, 0.0);
    
    // 2.srcImage -> context 画像コピー
    [image.image drawInRect:CGRectMake(0, 0,
                                             image.frame.size.width * 2,
                                             image.frame.size.height * 2)];
    // 3.context から UIImage 作成
    UIImage *dstImage = UIGraphicsGetImageFromCurrentImageContext();
    
    self.imageView2.frame = CGRectMake(self.imageView2.frame.origin.x,
                                       self.imageView2.frame.origin.y,
                                       dstImage.size.width,
                                       dstImage.size.height);
    self.imageView2.image = dstImage;
    UIGraphicsEndImageContext();
#endif
}

// 縮小コピー
- (IBAction)smallButtonDidTap:(id)sender {
    UIImageView *image = [self srcImage];
    
    // 1.コンテキスト作成 srcImageのサイズ
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(image.frame.size.width, image.frame.size.height), NO, 0.0);

    // 2.srcImage -> context 画像コピー
    [image.image drawInRect:CGRectMake(0, 0,
                                             image.frame.size.width / 2,
                                             image.frame.size.height / 2)];
    // 3.context から UIImage 作成
    UIImage *image2 = UIGraphicsGetImageFromCurrentImageContext();
    
    // 4.context破棄
    UIGraphicsEndImageContext();
    
    self.imageView2.frame = CGRectMake(self.imageView2.frame.origin.x,
                                       self.imageView2.frame.origin.y,
                                       image.frame.size.width,
                                       image.frame.size.height);
    self.imageView2.image = image2;
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
    
    self.imageView2.frame = CGRectMake(self.imageView2.frame.origin.x,
                                   self.imageView2.frame.origin.y,
                                   200,
                                   200);
    
    [image.image drawInRect:dstRect];
    UIImage *image2 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.imageView2.image = image2;
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
    
    self.imageView2.frame = CGRectMake(self.imageView2.frame.origin.x,
                                   self.imageView2.frame.origin.y,
                                   200,
                                   200);
    // 背景を黒で塗る
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 1.0);
    CGContextFillRect(context, CGRectMake(0, 0, 200, 200));

    
    [image.image drawInRect:dstRect];
    UIImage *image2 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.imageView2.image = image2;
}

- (void)segment1Changed:(UISegmentedControl*)segment
{
    if(segment.selectedSegmentIndex == 0){
        selectedSegment = 0;
        self.imageView1.hidden = YES;
        self.imageView12.hidden = NO;
    }
    else{
        selectedSegment = 1;
        self.imageView1.hidden = NO;
        self.imageView12.hidden = YES;
    }
}

@end
