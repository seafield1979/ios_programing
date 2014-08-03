//
//  sharedObject.m
//  console
//
//  Created by 海野 秀祐 on 2014/03/01.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//
/**
 アプリを通して１つしかインスタンスを持たないオブジェクト(シングルトン）のサンプル
 
 */

#import "sharedObject.h"

@implementation sharedObject

static sharedObject *obj;

// シングルトンオブジェクトを返す
// オブジェクトが未生成なら生成してから返す
+(sharedObject*)sharedObj
{
	if(!obj){
		obj = [[sharedObject alloc]init];

		obj.data = [[NSData alloc]init];
	}
	return obj;
}

// 強制的に新しいオブジェクトを生成する
+(sharedObject*)getNewObj
{
	return [[sharedObject alloc]init];
}

-(id)init
{
	self = [super init];
	if(self){
		self.name = @"name_none";
		self.data = [[NSData alloc]initWithBytes:[@"hello" UTF8String] length:[@"hello world" length]];
	}
	return self;
}

-(NSString*)description
{
	return [NSString stringWithFormat:@"%@ %@", _name, [_data description2]];
}

@end
