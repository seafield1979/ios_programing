//
//  NSObject+retainCount.h
//  console
//
//  Created by UnnoShusuke on 2014/09/11.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (retainCount)

- (CFIndex)referenceCount;

@end
