//
//  arrayTest.m
//  console
//
//  Created by 海野 秀祐 on 2014/07/29.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//
/**
 ■NSDictionary::  辞書配列
	 NSDictionary, NSMutableDictionary
	 初期化
	 // ディクショナリを作成する
	 NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:
	 @"銀座線", @"G",
	 @"丸ノ内線", @"M",
	 @"日比谷線", @"H",
	 @"東西線", @"T",
	 nil];
	 NSDictionary *dic2 = @{@"key1" : @"value1", @"key2" : "value2"};

	 要素数を取得
	 [dic1 count];

	 キーで要素を取り出す
	 NSString *str = [metro objectForKey:@"Z"];

	 全要素を表示
	 NSArray *keys = [dic allKeys];
	 for(NSString *key in keys){
	 NSLog(@"%@ %@", key, dic[key]);
	 }
	 define定義
	 #define DICTIONARY1 @{@"key1" : @"value1", @"key2" : @"value2", @"key3" : @"value3"}

	 #define DICTIONARY2 @{\
	 @"key1" : @"value1", \
	 @"key2" : @"value2", \
	 @"key3" : @"value3"
	 }
	 define参照
	 NSString *value = DICTIONARY1[@"key1"];

 ■NSMutableDictionary::
	 初期化
	 NSMutableDictionary *mdic  =  [NSMutableDictionary alloc]init];
	 NSMutableDictionary *mdic2 = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"value1", @"key1", @"value2", @"key2", nil];

	 要素を追加
	 [mdic setObject:@"value" forKey:@"key"];

	 要素を削除
	 [mdic removeObjectForKey:@"key"];

	 すべての要素を削除
	 [mdic removeAllObjects];
 */

#import "arrayTest.h"

#define ARRAY1 @[@"aaa", @"bbb", @"ccc"]

@implementation arrayTest

- (void) test1{

	// 初期化
	_arr1 = [[NSArray alloc]initWithObjects:@"111", @"222", @"333", nil];
	_marr1 = [[NSMutableArray alloc] initWithObjects:@"444", @"555", @"666", nil];

	// 追加
	[_marr1 addObject:@"777"];
	NSLog(@"1: %@", self);

	// 削除
	[_marr1 removeObjectAtIndex:1];
 
	// 参照
	for(int i=0; i<[_arr1 count]; i++){
		NSLog(@"arr%d: %@", i, [_arr1 objectAtIndex:i]);
	}
	for(int i=0; i<[_marr1 count]; i++){
		NSLog(@"mutable array%d: %@", i, [_marr1 objectAtIndex:i]);
	}

	// define参照
	NSLog(@"ARRAY1 %@ %@ %@", ARRAY1[0], ARRAY1[1], ARRAY1[2]);
	NSArray *ARRAY2 = @[\
			 @"aaa", \
			 @"bbb", \
			 @"ccc", \
			 ];
	NSLog(@"ARRAY2 %@", ARRAY2);


}

- (NSString*)description
{
	NSMutableString *ret_str = [[NSMutableString alloc]init];

	for(NSString *str in _arr1){
		[ret_str appendString:str];
	}
	for(NSString *str in _marr1){
		[ret_str appendString:str];
	}
	return ret_str;
}

@end
