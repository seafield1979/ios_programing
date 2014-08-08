//
//  ViewController.h
//  AOTutorialSample
//
//  Created by B02681 on 2014/08/07.
//  Copyright (c) 2014年 B02681. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIAlertViewDelegate>
- (IBAction)pushButton1:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *page1View;
@property (strong, nonatomic) IBOutlet UIView *page2View;
@property (weak, nonatomic) IBOutlet UIImageView *bokeText2View;
@property (weak, nonatomic) IBOutlet UIImageView *bokeText1View;
@property (weak, nonatomic) IBOutlet UIImageView *telop1View;
@property (weak, nonatomic) IBOutlet UIImageView *telop2View;
@property (weak, nonatomic) IBOutlet UIImageView *letsBokeView;

@property (weak, nonatomic) IBOutlet UIView *buttonAreaView;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *skipButtonView;

@end

@interface ZabutonView : UIView

@end
