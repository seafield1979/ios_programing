//
//  MovingImageView.h
//  AOTutorialSample
//
//  Created by B02681 on 2014/08/19.
//  Copyright (c) 2014年 B02681. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PRTween.h"

@interface MovingImageView : UIImageView

@property (assign) CGSize sizeDst;
@property (assign) CGPoint center1;

-(void)appearAnim:(float)time center_x:(float)center_x center_y:(float)center_y dst_width:(float)dst_width dst_height:(float)dst_height;;
-(void)disappearAnim;

@end
