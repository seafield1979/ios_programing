//
//  ViewControllerAffine.h
//  ViewTest
//
//  Created by UnnoShusuke on 2014/11/08.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerAffine : UIViewController

@property (weak, nonatomic) IBOutlet UISegmentedControl *transformSegment;
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIView *baseImageView2;
@property (weak, nonatomic) IBOutlet UISegmentedControl *rotDirectionSegment;


- (IBAction)translateButtonDidTap:(id)sender;

- (IBAction)scaleUpButtonDidTap:(id)sender;
- (IBAction)scaleDownButtonDidTap:(id)sender;
- (IBAction)rotateButtonDidTap:(id)sender;
- (IBAction)rotateButton2DidTap:(id)sender;

@end
