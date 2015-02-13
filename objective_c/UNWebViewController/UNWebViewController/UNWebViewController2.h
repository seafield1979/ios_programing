//
//  UNWebViewController2.h
//  UNWebViewController
//
//  Created by B02681 on 2015/02/12.
//  Copyright (c) 2015年 B02681. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UNTitleImageView.h"

@interface UNWebViewController2 : UIViewController <UIWebViewDelegate, UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@property (weak, nonatomic) IBOutlet UNTitleImageView *titleImageView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *bgScrollView;
@end
