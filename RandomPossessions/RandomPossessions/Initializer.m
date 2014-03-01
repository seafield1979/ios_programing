//
//  Initializer.m
//  RandomPossessions
//
//  Created by 海野 秀祐 on 2014/03/01.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//
/*
 イニシャライザテスト
 指定イニシャライザ
   確実にインスタンス変数を有効な値にするイニシャライザ


 */

#import "Initializer.h"

@implementation Initializer


/**
 * デフォルトのイニシャライザ
 * 指定イニシャライザを呼び出す
 */
- (id)init
{
	self = [self initWithAll:nil value:0];
	return self;
}

/**
 * 指定イニシャライザ
 */
- (id)initWithAll:(NSString*)str value:(int)value
{
	// スーパークラスのイニシャライザを呼び出す（必須）
	self = [super init];

	// スーパークラスのイニシャライザが成功したら自分のイニシャライザを行う
	if(self){
		if(!str)   str = @"none";
		self.str1 = str;
		self.i1 = value;
		self.data = [[NSData alloc]init];
	}

	// イニシャライザはselfを返す
	return self;
}


/**
 * str1のみ受け取るイニシャライザ
 */
- (id)initWithString:(NSString*)str
{
	self = [self initWithAll:str value:0];
	return self;
}

/**
 * クラスの情報を文字列で取得する
 */
- (NSString*)description
{
	return [NSString stringWithFormat:@"%@ %d", _str1, _i1];
}

@end
