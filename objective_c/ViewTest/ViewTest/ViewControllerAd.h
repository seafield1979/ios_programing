//
//  ViewControllerAd.h
//  ViewTest
//
//  Created by B02681 on 2014/08/25.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface ViewControllerAd : UIViewController <ADBannerViewDelegate>
- (IBAction)ad2ButtonDidTap:(id)sender;
- (IBAction)ad1ButtonDidTap:(id)sender;

@property (nonatomic, strong) ADBannerView *adView;



@end
