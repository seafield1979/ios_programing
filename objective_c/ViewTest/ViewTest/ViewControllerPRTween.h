//
//  ViewControllerPRTween.h
//  ViewTest
//
//  Created by B02681 on 2014/08/19.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PRTween.h"

@interface ViewControllerPRTween : UIViewController
{
	PRTweenOperation *activeTweenOperation;
}
@property (weak, nonatomic) IBOutlet UIView *testView;

- (IBAction)pushTween1:(id)sender;
- (IBAction)pushTween2:(id)sender;
- (IBAction)pushTween3:(id)sender;
- (IBAction)pushTween4:(id)sender;

@end
