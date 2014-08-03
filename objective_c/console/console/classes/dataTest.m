//
//  dataTest.m
//  console
//
//  Created by 海野 秀祐 on 2014/07/30.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import "dataTest.h"

@implementation dataTest

/*
 * NSKeyedArchiverクラスを使用してオブジェクトをNSDataに変換する
 */
-(void)test1
{
	// NSDictionary型→NSData型→NSDictionary型
	// NSDictionaryオブジェクトを生成
	NSDictionary *dic =[NSDictionary dictionaryWithObject:@"hoge" forKey:@"KEY"];
	NSArray *arr = @[@"aaa", @"bbb", @"ccc"];

	// 生成したオブジェクトをNSData型に変換
//	NSData *d = [NSKeyedArchiver archivedDataWithRootObject:dic];
	NSData *d = [NSKeyedArchiver archivedDataWithRootObject:arr];

	// NSData型オブジェクトをNSDictionary型に変換
//	NSDictionary *reverse = [NSKeyedUnarchiver unarchiveObjectWithData:d];
	NSArray *reverse = [NSKeyedUnarchiver unarchiveObjectWithData:d];

	NSLog(@"reverse: %@", reverse);
}

/**
 * プロジェクトの test1.txt を NSDataに読み込む
 * 文字列をNSDataに変換して test2.txt に書き出す
 */
-(void)test2
{
	{
		NSString *homeDir = NSHomeDirectory();
		NSLog(@"%@", homeDir);

		// ファイルからNSDataを作成
		// 事前準備として プロジェクトの[Build Phases] - [Copy Files] に
		// Destination - Absolute Path
		// Path - $(Home)
		// を設定する。こうすることでホームディレクトリにCopy Filesのファイルがコピーされる
		NSString *path = [NSString stringWithFormat:@"%@/test1.txt", homeDir];
		NSData *data = [[NSData alloc]initWithContentsOfFile:path];

		// ファイルにNSDataを書き出す
		NSData *data2  = [[NSData alloc]initWithBytes:[@"syutaro" UTF8String] length:[@"syutaro" length]];
		NSString *writePath = [NSString stringWithFormat:@"%@/test2.txt", homeDir];
		[data2 writeToFile:writePath atomically:YES];

		// 表示(16進数)
		NSLog(@"NSData %@", [data description]);

		// 文字列で表示
		NSLog(@"NSData(str) %@", [data description2]);

		// データ長
		NSUInteger len = [data length];
		NSLog(@"NSData(length) %lu", len );
	}
}
@end
