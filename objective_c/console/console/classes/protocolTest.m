//
//  protocolTest.m
//  console
//
//  Created by 海野 秀祐 on 2014/08/02.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//
/*
 Javaのインターフェイスのようなもの。
 一式の機能を実現するためのメソッドのリストをセットで用意しておき、これを一式の機能を実現させたいクラスに
 設定する。この一式の機能リストがプロトコル。プロトコルを設定したクラスはプロトコルのメソッドを実装しなければならない。

 プロトコルの宣言
 @protocol USAddMul
 -(float)add:(float)val1 val2:(float)val2;
 -(float)mul:(float)val1 val2:(float)val2;
 @end
 USAddMulというプロトコルは addとmulというメソッドを持つ。

 プロトコルの採用
 @interface USCalclate <USAddMul>
 USCalclate クラスで USAddMul プロトコルを実装することを宣言する

 プロトコルの実装
 プロトコルを採用したクラス（ここでは USCalclateクラス）にUSAddMulのメソッドadd,mulを実装する
 ※プロトコルで定義したすべてのメソッドを実装しないと警告が出る。

 */


#import "protocolTest.h"

@implementation protocolTest
@synthesize name = _name;

-(void)test1
{
	[self print];
}
-(int)add:(int)a b:(int)b
{
	return a + b;
}
-(int)mul:(int)a b:(int)b
{
	return a * b;
}
-(void)print
{
	NSLog(@"protocolTest::print %d %d", [self add:1 b:2], [self mul:10 b:20]);
}

@end
