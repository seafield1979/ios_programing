//
//  ViewController4.h
//  ViewTest
//
//  Created by UnnoShusuke on 2014/08/25.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController4 : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imageView1;
@property (strong, nonatomic) IBOutlet UIImageView *imageView2;
@property (strong, nonatomic) IBOutlet UIImageView *imageView12;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segment1;

- (UIImageView*) srcImage;

- (IBAction)copyButtonDidTap:(id)sender;
- (IBAction)bigButtonDidTap:(id)sender;
- (IBAction)smallButtonDidTap:(id)sender;
- (IBAction)trim1ButtonDidTap:(id)sender;
- (IBAction)trim2ButtonDidTap:(id)sender;


@end
