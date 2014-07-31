//
//  userDefaultTest.h
//  console
//
//  Created by 海野 秀祐 on 2014/07/30.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface userDefaultTest : NSObject
{
	NSMutableDictionary *data1;
}

- (void)init1;
- (void)save1;
- (void)load1;
@end
