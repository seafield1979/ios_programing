//
//  sharedObject.m
//  console
//
//  Created by 海野 秀祐 on 2014/03/01.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import "sharedObject.h"

@implementation sharedObject

static sharedObject *obj;

+(sharedObject*)sharedObj
{
	if(!obj){
		obj = [[sharedObject alloc]init];

		obj.data = [[NSData alloc]init];
	}
	return obj;
}

+(sharedObject*)getNewObj
{
	return [[sharedObject alloc]init];
}

-(id)init
{
	self = [super init];
	if(self){
		self.name = @"none";
		self.data = [[NSData alloc]initWithBytes:[@"hello" UTF8String] length:[@"hello world" length]];
	}
	return self;
}

-(NSString*)description
{
	return [NSString stringWithFormat:@"%@ %@", _name, [_data description2]];
}

@end
