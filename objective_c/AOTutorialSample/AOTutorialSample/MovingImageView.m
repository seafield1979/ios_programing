//
//  MovingImageView.m
//  AOTutorialSample
//
//  Created by B02681 on 2014/08/19.
//  Copyright (c) 2014年 B02681. All rights reserved.
//

#import "MovingImageView.h"

@implementation MovingImageView
{
	PRTweenOperation *activeTweenOperation;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)appearAnim:(float)time center_x:(float)center_x center_y:(float)center_y dst_width:(float)dst_width dst_height:(float)dst_height

{
    _center1.x = center_x;
    _center1.y = center_y;
    _sizeDst.width = dst_width;
    _sizeDst.height = dst_height;

	[[PRTween sharedInstance] removeTweenOperation:activeTweenOperation];
	
    PRTweenPeriod *period = [PRTweenPeriod periodWithStartValue:0.0 endValue:1.0 duration: time];
	activeTweenOperation = [[PRTween sharedInstance] addTweenPeriod:period
		updateBlock:^(PRTweenPeriod *period) {
            // 徐々に拡大
            float width = period.tweenedValue * _sizeDst.width;
            float height = period.tweenedValue * _sizeDst.height;
			self.frame = CGRectMake(
			self.center1.x - width / 2,
			self.center1.y - height / 2,
            width, height );
        }
        completionBlock:^(void) {
			NSLog(@"Completed tween");
        }
    ];
}

-(void)disappearAnim
{
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
