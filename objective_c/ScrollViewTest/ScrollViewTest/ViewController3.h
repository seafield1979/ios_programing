//
//  ViewController3.h
//  ScrollViewTest
//
//  Created by B02681 on 2014/08/07.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController3 : UIViewController <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UISwitch *switch1;
@property (weak, nonatomic) IBOutlet UILabel *label1;
- (IBAction)switch1Changed:(id)sender;

@end
