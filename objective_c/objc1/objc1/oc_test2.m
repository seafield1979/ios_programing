//
//  oc_test2.m
//  objective_c_test1
//
//  Created by 海野 秀祐 on 2013/08/04.
//  Copyright (c) 2013年 海野 秀祐. All rights reserved.
//
// インスタンスメソッドとクラスメソッド
// 継承
// カテゴリ
// プロトコル
//

#import "oc_test2.h"




@implementation oc_test2

-(void)test01
{
	//[self test_protocol];
	//[self test_block];
	//[self test_category];
	[self test_subclass];
}

-(void)test_subclass
{
	superclass *superc = [[superclass alloc]init];
	subclass *subc = [[subclass alloc]init];

	[superc method1];
	[subc method1];

}

-(void)test_category
{
	NSString *str1 = @"str1";
	NSString *str2 = [str1 add01];
	NSString *str3 = [str1 add02];
	NSLog(@"%@ %@", str2, str3);
}

#pragma mark - Protcols

// プロトコルテスト
// Protocol01で定義されたメソッドをすべて実装する
-(NSString*)protocol_test1
{
	return @"protocol_test2";
}
-(void)protocol_test2:(NSString *)aaa
{
	NSLog(@"%@", aaa);
}
-(void)protocol_test3
{
	// nothing to do s
}

#pragma mark - Blocks

//ブロック構文はiOS4.0から使えるようになった新しい機能です．ブロック構文を使用することでその場限りの関数を式として作成することができます．JavaScriptなどの言語を使ったことのある人にはクロージャ，関数型言語を使ったことのある人にはラムダ式といった方がわかりやすいかも知れません．
//  __blockをつけることでブロック内で変数の変更が可能になる
// ブロック構文の関数を作成する
// 同じ値なら真

-(void)test_block
{
	// 「__block」修飾子をつけることでブロック内での変更が可能になります．
	__block int x = 300;

	// ブロックの定義
	// 戻り値 (^ブロック名)(型, 型,...) = ^(型 引数1, 型 引数2, ...){
	//  処理
	// }
	// 引数なし
	void (^block1)() = ^{
		x = x * 2;
		NSLog(@"%d", x);
	};
	block1();

	// 引数あり
	void (^block2)(int, int) = ^(int aaa, int bbb) {
		x += aaa;
		x += bbb;
		NSLog(@"%d", x);
	};
	block2(1,2);

	// 引数、戻り値あり
	int (^block3)(int) = ^(int aaa){
		return x + aaa;
	};
	NSLog(@"%d", block3(100));


	//--------------------------
	// 定義済みの型を使用
	//--------------------------
	double base1 = 100.0f;
	doubleCalc add = ^(double num1, double num2) {
		return base1 + num1 + num2;
	};

	doubleCalc mul = ^(double num1, double num2) {
		return base1 + num1 * num2;
	};

	NSLog(@"%f %f", add(1.0, 2.0), mul(1.0, 2.0));

	// もう一回
	base1 = 100.0f;
	add = ^(double num1, double num2) {
		return base1 + num1 + num2;
	};

	mul = ^(double num1, double num2) {
		return base1 + num1 * num2;
	};

	NSLog(@"%f %f", add(1.0, 2.0), mul(1.0, 2.0));
	
}

@end

#pragma mark - Subclass
@implementation superclass
-(void)method1
{
	NSLog(@"superclass:method1");
}
@end
@implementation subclass
-(void)method1
{
	// スーパークラスのメソッド呼び出し
	[super method1];
	NSLog(@"subclass:method1");
}
@end



#pragma mark - Category

@implementation NSString (USAdd)
// カテゴリ
// oc_test2を拡張するメソッド
/*
 *  元の文字列に add01を追加したものを返す
 */
-(NSString*)add01
{
	return [NSString stringWithFormat:@"%@ add01", self];
}
/*
 *  元の文字列に add02を追加したものを返す
 */
-(NSString*)add02
{
	return [NSString stringWithFormat:@"%@ add02", self];

}
@end
