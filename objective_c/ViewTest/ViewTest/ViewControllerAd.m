//
//  ViewControllerAd.m
//  ViewTest
//
//  Created by B02681 on 2014/08/25.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//
/*
 iAdで広告を表示する
 
 */
#import "ViewControllerAd.h"

@interface ViewControllerAd ()
{
    BOOL bannerIsVisible;
}

@end

@implementation ViewControllerAd

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
    
    // 広告１を準備
    _adView = [[ADBannerView alloc] init];
    _adView.frame = CGRectMake(0, -_adView.frame.size.height, _adView.frame.size.width, _adView.frame.size.height);
    _adView.delegate = self;
    _adView.autoresizesSubviews = YES;
    _adView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
    [self.view addSubview:_adView];
    _adView.alpha = 0.0;
    
    // テキスト内のURLをリンク形式で表示する
    self.textView1.dataDetectorTypes = UIDataDetectorTypeLink;
    self.textView1.delegate = self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ad1ButtonDidTap:(id)sender {
    [UIView animateWithDuration:0.7f
                     animations:^{
                         // アニメーションをする処理
                         _adView.frame = CGRectMake(0,0, _adView.frame.size.width, _adView.frame.size.height);
                         _adView.alpha = 1.0;
                     }];
}

- (IBAction)ad2ButtonDidTap:(id)sender {
    
}

#pragma mark - ADBannerViewDelegate

// iADの広告がロードされた
- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    if (!bannerIsVisible) {
        [UIView beginAnimations:@"animateAdBannerOn" context:NULL];
        [UIView setAnimationDuration:0.3];
        
        banner.frame = CGRectOffset(banner.frame, 0, CGRectGetHeight(banner.frame));
        banner.alpha = 1.0;
        
        [UIView commitAnimations];
        bannerIsVisible = YES;
    }
}

// iADの広告がロードできない
- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    if (bannerIsVisible) {
        [UIView beginAnimations:@"animateAdBannerOff" context:NULL];
        [UIView setAnimationDuration:0.3];
        
        banner.frame = CGRectOffset(banner.frame, 0, -CGRectGetHeight(banner.frame));
        banner.alpha = 0.0;
        
        [UIView commitAnimations];
        bannerIsVisible = NO;
    }
}

// バナーをタップしたときに呼ばれる
// @return  YES:広告を表示 / NO:広告を非表示
- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave
{
    return YES;
}

// 広告画面から復帰した
- (void)bannerViewActionDidFinish:(ADBannerView *)banner
{
    
    
}


#pragma mark - UITextViewDelegate
- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange
{
    NSLog(@"%@", URL);
    return YES;
}

@end
