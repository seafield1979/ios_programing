//
//  NSData+custom.m
//  console
//
//  Created by 海野 秀祐 on 2014/03/01.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//
// カテゴリを使用して既存のクラスを拡張する
/*
 
 @implementation 拡張元のクラス (拡張名)
 例: @implementation NSString (MyModule) 
 */

#import "NSData+custom.h"

@implementation NSData (custom)

-(NSString*)description2
{
	return [[NSString alloc]initWithData:self encoding:NSUTF8StringEncoding];
}

@end
