//
//  UNEffect1.h
//  ViewTest
//
//  Created by UnnoShusuke on 2014/11/01.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import "UNImageView.h"

typedef NS_ENUM (NSInteger, UNEffectMode)
{
    UNEffectModeLeft = 0,
    UNEffectModeRight
};

@interface UNEffect1 : UNImageView

@property (nonatomic) CGPoint baseCenter;
@property (nonatomic) CGRect baseFrame;

- (void)startAnimation:(UNEffectMode)mode;
//- (void)setBaseCenter:(CGPoint)center;

@end
