//
//  categoryTest.m
//  console
//
//  Created by 海野 秀祐 on 2014/08/03.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//
/*
 既存のクラスに新しい機能を追加する。NSString等の標準のクラスにも追加することが可能。
 追加方法
 xcodeのファイルの新規作成 - [Cocoa Touch] - [Objective-C category] でCategory名 (NSString+LogのLogの部分)とベース入力

 */

#import "categoryTest.h"

@implementation categoryTest

-(void)test1
{
	NSLog(@"categoryTest::test1");
	[self test2];
}
@end

@implementation categoryTest (Append)
-(void)test2
{
	NSLog(@"categoryTest+Append::test2");
}
@end
