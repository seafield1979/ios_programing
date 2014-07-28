//
//  sharedObject.h
//  console
//
//  Created by 海野 秀祐 on 2014/03/01.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

@interface sharedObject : NSObject

@property NSString *name;
@property NSData *data;


+(sharedObject*)sharedObj;
+(sharedObject*)getNewObj;

@end
