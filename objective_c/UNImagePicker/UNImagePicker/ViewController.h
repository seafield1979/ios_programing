//
//  ViewController.h
//  UNImagePicker
//
//  Created by UnnoShusuke on 2014/08/24.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *imageView1;
@property (strong, nonatomic) IBOutlet UILabel *label1;
- (IBAction)saveButtonDidTap:(id)sender;
- (IBAction)cameraButtonDidTap:(id)sender;
- (IBAction)libButtonDidTap:(id)sender;
@end
