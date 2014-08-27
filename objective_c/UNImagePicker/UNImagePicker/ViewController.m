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
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    
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
    
	// ファイルに保存する
	if (false){
		UIImageWriteToSavedPhotosAlbum(image, self, @selector(targetImage:didFinishSavingWithError:contextInfo:), NULL);
	}
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

// カメラボタンをタップ
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
