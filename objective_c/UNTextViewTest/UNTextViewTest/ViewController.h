//
//  ViewController.h
//  UNTextViewTest
//
//  Created by B02681 on 2014/12/18.
//  Copyright (c) 2014年 B02681. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIScrollViewDelegate, UITextViewDelegate>


@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (weak, nonatomic) IBOutlet UIView *baseView;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

