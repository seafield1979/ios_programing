//
//  NSObject+retainCount.m
//  console
//
//  Created by UnnoShusuke on 2014/09/11.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import "NSObject+retainCount.h"

@implementation NSObject (retainCount)

- (CFIndex)referenceCount
{
    return CFGetRetainCount((__bridge CFTypeRef)self);
}

@end
