//
//  main.m
//  console
//
//  Created by 海野 秀祐 on 2014/03/01.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Initializer.h"
#import "sharedObject.h"


void testSharedObject();
void testNSData();


int main(int argc, const char * argv[])
{

	@autoreleasepool {
	    
	    // insert code here...
	    NSLog(@"Hello, World!");

		testSharedObject();
		testNSData();

	}
    return 0;
}

/**
 * sharedObjectクラスのテスト
 */
void testSharedObject()
{
	sharedObject *so = [sharedObject sharedObj];
	NSLog(@"sharedObject %@", so);

	sharedObject *so2 = [sharedObject getNewObj];
	NSLog(@"sharedObject %@", so2);

}

/**
 * NSDataのテスト
 */
void testNSData()
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
	NSLog(@"NSData(length) %lu", len ) ;
}

