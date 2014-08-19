//
//  ViewController.h
//  AOTutorialSample
//
//  Created by B02681 on 2014/08/07.
//  Copyright (c) 2014年 B02681. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZabutonView : UIImageView

@end

@interface ViewController : UIViewController <UIAlertViewDelegate>
- (IBAction)pushButton1:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *page1View;
@property (weak, nonatomic) IBOutlet UIView *bokeImageView;
@property (weak, nonatomic) IBOutlet UIImageView *bokeText1View;
@property (weak, nonatomic) IBOutlet UIImageView *bokeText2View;
@property (weak, nonatomic) IBOutlet UIImageView *howToBokeView;
@property (weak, nonatomic) IBOutlet UIImageView *letsTapView;
@property (weak, nonatomic) IBOutlet ZabutonView *zabutonView;

@property (weak, nonatomic) IBOutlet UIImageView *letsBokeView;
@property (weak, nonatomic) IBOutlet UIImageView *balloneView;

@property (strong, nonatomic) IBOutlet UIView *page2View;

@property (weak, nonatomic) IBOutlet UIView *buttonAreaView;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *skipButtonView;


- (IBAction)pushHowToText:(id)sender;
- (IBAction)pushLoginButton:(id)sender;
- (IBAction)pushSkipButton:(id)sender;


@end
