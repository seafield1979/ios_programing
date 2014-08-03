//
//  stringTest.m
//  console
//
//  Created by 海野 秀祐 on 2014/07/29.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//
/*
	NSString のサンプル
 
 */

#import "stringTest.h"

@implementation stringTest


/*
 * NSStringのテスト
 */
-(void)test1
{
	// 初期化メソッド
	NSString *str1 = nil;
	str1 = [[NSString alloc]initWithUTF8String:"あいうえお"];
	str1 = [[NSString alloc]initWithFormat:@"%s %d", "format", 100];
	str1 = [NSString stringWithFormat:@"%s %d", "stringWithFormat", 100];
	str1 = @"1234567890";
	NSLog(@"%@", str1);

	//
	int len = (int)[str1 length];
	NSLog(@"length %@ %d", str1, len);

	BOOL eq = [str1 isEqualToString:@"aaa"];

	NSString *str2 = [str1 stringByAppendingString:@" mogumogu"];

	// 後方切り出し
	str2 = [str1 substringFromIndex:4];
	NSLog(@"substringFromIndex 4:%@", str2);

	// 前方切り出し
	str2 = [str1 substringToIndex:4];
	NSLog(@"substringToIndex 4:%@", str2);

	// 部分切り出し
	str2 = [str1 substringWithRange: NSMakeRange(2, 6)];
	NSLog(@"substringWithRange 2,6:%@", str2);

	// 文字列の先頭比較
	eq = [str1 hasPrefix:@"123"];
	NSLog(@"hasPrefix: %d", eq);
	eq = [str1 hasSuffix:@"890"];
	NSLog(@"hasSuffix: %d", eq);

	// 文字列の検索
	NSRange range = [str1 rangeOfString:@"567"];
	NSLog(@"rangeOfString %ld %lu", (long)(range.location), range.length);

	NSNumber *num1 = [NSNumber numberWithInt:10];
	NSLog(@"NSNumber %@", num1);

}

/*
 * NSMutableStringのテスト
 */
-(void)test2
{
	NSMutableString *mstr = [NSMutableString stringWithString:@"aaa"];

	// 文字列追加
	[mstr appendString:@" bbb"];
	NSLog(@"appendString %@", mstr);

	// 文字列置き換え
	[mstr setString:@"ccc"];
	NSLog(@"setString %@", mstr);

	// 文字列を挿入する
	[mstr insertString:@"ddd" atIndex:[mstr length] - 1];
	NSLog(@"insertString %@", mstr);

	// 指定した位置の文字列を削除する
	[mstr setString:@"1234567890"];
	[mstr deleteCharactersInRange:NSMakeRange(2, 4)];
	NSLog(@"deleteCharactersInRange %@", mstr);

	// 指定した位置の文字列を置き換える
	[mstr setString:@"1234567890"];
	[mstr replaceCharactersInRange:NSMakeRange(2, 4) withString:@"aaa"];
	NSLog(@"replaceCharactersInRange %@", mstr);

}
@end
