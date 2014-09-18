//
//  GestureViewController.h
//  ResponderTest
//
//  Created by B02681 on 2014/08/19.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GestureViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *label1;

@property (strong, nonatomic) IBOutlet UIView *subview1;
@property (strong, nonatomic) IBOutlet UIView *subview2;
@property (weak, nonatomic) IBOutlet UIView *subview3;
@end
