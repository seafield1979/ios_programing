//
//  ViewController.m
//  UNImagePicker
//
//  Created by UnnoShusuke on 2014/08/24.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UIImagePickerControllerDelegate

// カメラがキャンセルされたときの処理
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
	_label1.text = @"canceled";
	//[self dismissModalViewControllerAnimated:YES];
	// ios6
	[self dismissViewControllerAnimated:YES completion:nil];
}


// 撮影されたときに呼ばれる処理
#define DIV_CONTEXT (2)         // コンテキストのサイズの調整値
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    // 選択した画像のサイズが大きいなら縮小する
    float divImageRatio = 1.0;
    if(image.size.width > 1000 || image.size.height > 1000){
        float length = (image.size.width > image.size.height) ? image.size.width : image.size.height;
        divImageRatio = 1000 / length;
    }
#if 1
	[self dismissViewControllerAnimated:YES completion:nil];
    
	// imageviewに表示する
    // imageView1の範囲に収まるようにサイズを調整
    UIImage *img_ato;  // リサイズ後UIImage
    CGSize size_dst = _imageView1.frame.size;
    
    //縦横比を調整
    float orgRatio = _imageView1.frame.size.width / _imageView1.frame.size.height;
    float srcRatio = image.size.width / image.size.height;
    if(orgRatio < srcRatio){
        // 読み込んだ画像の方が横長、横サイズを固定
        size_dst.width = _imageView1.frame.size.width;
        size_dst.height = image.size.height * (_imageView1.frame.size.width / image.size.width);
    }
    else{
        // 読み込んだ画像が縦長
        size_dst.width = image.size.width * (_imageView1.frame.size.height / image.size.height);
        size_dst.height = _imageView1.frame.size.height;
    }
    
    // 縦横比の調整
    // 元画像の縦横比と表示画像の縦横比が異なる場合はアスペクト比が崩れないように元画像をトリミングする
    UIGraphicsBeginImageContext(CGSizeMake(_imageView1.frame.size.width, _imageView1.frame.size.height));
    //イメージ用グラフィックスコンテクスト取得
    UIGraphicsBeginImageContextWithOptions(_imageView1.frame.size, NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 背景
    CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 1.0);
    CGContextFillRect(context, CGRectMake(0, 0, _imageView1.frame.size.width, _imageView1.frame.size.height));
    
    [image drawInRect:CGRectMake((_imageView1.frame.size.width - size_dst.width) / 2, (_imageView1.frame.size.height - size_dst.height) / 2,size_dst.width,size_dst.height)];
    img_ato = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    _imageView1.image = img_ato;
    
#else
    
    // 中央部分を切り出す
    CGSize img1Size = image.size;
    CGRect dstRect;
    if(img1Size.width > img1Size.height){
        // 横長
        dstRect.origin.x = (img1Size.height - img1Size.width) / 2;
        dstRect.origin.y = 0;
        dstRect.size.width = img1Size.width;
        dstRect.size.height = img1Size.height;
        
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(img1Size.height * divImageRatio, img1Size.height * divImageRatio), NO, 0.0);
    }
    else{
        // 縦長
        dstRect.origin.x = 0;
        dstRect.origin.y = (img1Size.width - img1Size.height) / 2;
        dstRect.size.width = img1Size.width;
        dstRect.size.height = img1Size.height;
        
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(img1Size.width * divImageRatio, img1Size.width * divImageRatio), NO, 0.0);
    }
    dstRect.origin.x *= divImageRatio;
    dstRect.origin.y *= divImageRatio;
    dstRect.size.width *= divImageRatio;
    dstRect.size.height *= divImageRatio;

    _imageView1.frame = CGRectMake(_imageView1.frame.origin.x,
                                   _imageView1.frame.origin.y,
                                   200,
                                   200);
    
    [image drawInRect:dstRect];
    UIImage *image2 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    _imageView1.image = image2;
    
#endif
    
    [self dismissViewControllerAnimated:YES completion:nil];

}

// 保存完了時のイベント
-(void)targetImage:(UIImage*)image didFinishSavingWithError:(NSError*)error contextInfo:(void*)context
{
	if (error) {
		_label1.text = @"save error";
	}
	else {
		_label1.text = @"save ok";
	}
}

#pragma mark - Action methos

/*
 * ファイルに保存する
 */
- (IBAction)saveButtonDidTap:(id)sender {
	if (_imageView1.image){
		UIImageWriteToSavedPhotosAlbum(_imageView1.image, self, @selector(targetImage:didFinishSavingWithError:contextInfo:), NULL);
        NSLog(@"+++++++++ save image");
	}
}

- (IBAction)cameraButtonDidTap:(id)sender {
    if( ![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        return;
    }
        
    UIImagePickerController *ip = [[UIImagePickerController alloc]init];
    ip.sourceType = UIImagePickerControllerSourceTypeCamera;
    ip.delegate = self;
    ip.allowsEditing = NO;
    
    // カメラのViewに重ねる
    CGSize size = ip.view.frame.size;
    NSLog(@"%f %f", size.width, size.height);
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, (size.height - size.width)/2, size.width, size.width)];
    view.layer.borderWidth = 3.0;
    view.layer.borderColor = [[UIColor redColor] CGColor];
    ip.cameraOverlayView = view;
    
    [self presentViewController: ip animated:YES completion: nil];
}

// ライブラリボタンをタップ
- (IBAction)libButtonDidTap:(id)sender {
    if( ![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]){
        return;
    }

    UIImagePickerController *ipc = [[UIImagePickerController alloc]init];
    ipc.delegate = self;
    ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:ipc animated:YES completion:nil];
}

@end
