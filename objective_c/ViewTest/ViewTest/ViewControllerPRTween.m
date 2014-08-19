//
//  ViewControllerPRTween.m
//  ViewTest
//
//  Created by B02681 on 2014/08/19.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import "ViewControllerPRTween.h"
#import "PRTween.h"

@interface ViewControllerPRTween ()

@end

@implementation ViewControllerPRTween

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
}

- (void)update:(PRTweenPeriod*)period {
    if ([period isKindOfClass:[PRTweenCGPointLerpPeriod class]]) {
        _testView.center = [(PRTweenCGPointLerpPeriod*)period tweenedCGPoint];
    } else {
        _testView.frame = CGRectMake(0, period.tweenedValue, 100, 100);
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushTween1:(id)sender {
	[[PRTween sharedInstance] removeTweenOperation:activeTweenOperation];
    
    PRTweenPeriod *period = [PRTweenPeriod periodWithStartValue:0.0 endValue:400.0 duration:1.5];
	
    activeTweenOperation = [[PRTween sharedInstance] addTweenPeriod:period target:self selector:@selector(update:)];
}

- (IBAction)pushTween2:(id)sender {
}

- (IBAction)pushTween3:(id)sender {
}

- (IBAction)pushTween4:(id)sender {
    PRTweenPeriod *period = [PRTweenPeriod periodWithStartValue:0.0 endValue:400.0 duration:1.5];
	activeTweenOperation = [[PRTween sharedInstance] addTweenPeriod:period
														updateBlock:^(PRTweenPeriod *period) {
															_testView.frame = CGRectMake(0, period.tweenedValue, period.tweenedValue, 100);
														} completionBlock:^(void) {
															NSLog(@"Completed tween");
														}];
}
@end
