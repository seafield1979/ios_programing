//
//  blockTest.m
//  console
//
//  Created by 海野 秀祐 on 2014/08/02.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//
/**
 ブロック構文
 ブロック構文の基本的な書き方
	^(仮引数) {
		実行する処理
	};

	代入する場合
	戻り値 (^変数名)(引数) = ^(仮引数) {
		実行する処理
	};
 */

#import "blockTest.h"

@implementation blockTest

// ブロック型を引数として受け取るメソッド
-(int)intBlockFunc1:(intBlock)block1
{
	return block1(10, 20);
}

-(float)floatBlockFunc1:(floatBlock)block1
{
	return block1(100,200);
}

-(void)test1
{
	// ブロック構文によりpower関数を作成
	int (^power)(int) = ^(int x) {
		return x * x;
	};
	int p1 = power(10);
	NSLog(@"power 10: %d", p1);

	// 事前にtypedefで作成していたブロック型を使用する
	intBlock ib1 = ^(int a, int b){
		return a + b;
	};
	int int1 = ib1(100,200);

	floatBlock fb1 = ^(float a, float b){
		return a + b;
	};
	float float1 = fb1(100,200);

	stringBlock sb1 = ^(NSString *a, NSString *b){
		return [NSString stringWithFormat:@"%@ %@", a, b];
	};
	NSString *str1 = sb1(@"aaa", @"bbb");

	// ブロック型を受け取る関数
	int aaa = [self intBlockFunc1:^int(int a, int b) {
		NSLog(@"block test 1");
		return a + b;
	}];
	NSLog(@"aaa : %d", aaa);

	float bbb = [self floatBlockFunc1:^float(float a, float b) {
		NSLog(@"block test 2");
		return a * b;
	}];
	NSLog(@"bbb : %f", bbb);


	NSLog(@"int1:%d float1:%f str1:%@", int1, float1, str1);

}


@end
