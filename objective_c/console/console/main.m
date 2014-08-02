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
#import "userDefaultTest.h"
#import "classTest.h"
#import "arrayTest.h"
#import "dictionaryTest.h"

void testSharedObject();
void testNSData();


int main(int argc, const char * argv[])
{

	@autoreleasepool {

	    // insert code here...
	    printf("please input command\ninit/save/load/delete/exit\n");

		// userDefaultTestのテスト
		userDefaultTest *udt = [[userDefaultTest alloc]init];

		char cmd_buf[32] = {"\0"}, *pos1;
		while(1){
			printf(">");
			fgets(cmd_buf, sizeof(cmd_buf) - 1, stdin);
			//最後の改行を削除
			pos1 = strstr(cmd_buf, "\n");
			if(pos1){
				*pos1 = '\0';
			}

			NSLog(@"%s", cmd_buf);
			if(0 == strcmp((const char*)cmd_buf, "init")){
				[udt setDefault];
			}
			else if(0 == strcmp((const char*)cmd_buf, "save")){
				[udt save1];
			}
			else if(0 == strcmp((const char*)cmd_buf, "save2")){
				[udt save2];
			}
			else if(0 == strcmp((const char*)cmd_buf, "load")){
				[udt load1];
			}
			else if(0 == strcmp((const char*)cmd_buf, "load2")){
				[udt load2];
			}
			else if(0 == strcmp((const char*)cmd_buf, "delete")){
				[udt delete1];
			}
			else if(0 == strcmp((const char*)cmd_buf, "class")){
				classTest *cl1 = [[classTest alloc]init];
				classTest2 *cl2 = [[classTest2 alloc]init];
				[cl1 print];
				[cl1 print:100 val2:@"hello"];
				[cl2 print];
			}
			else if(0 == strcmp((const char*)cmd_buf, "cinit")){
				initTest *cinit1 = [[initTest alloc]init];
				[cinit1 print];
				initTest *cinit2 = [[initTest alloc]initWithValue1:100];
				[cinit2 print];
				initTest *cinit3 = [[initTest alloc]initWithAllParams:100 val2:200 val3:300];
				[cinit3 print];

			}
			else if(0 == strcmp((const char*)cmd_buf, "crelease")){
				releaseTest *crel = [[releaseTest alloc]init];
				[crel print];
			}
			else if(0 == strcmp((const char*)cmd_buf, "array1")){
				arrayTest *arr = [[arrayTest alloc]init];
				[arr test1];
			}
			else if(0 == strcmp((const char*)cmd_buf, "dic1")){
				dictionaryTest *dic = [[dictionaryTest alloc]init];
				[dic test1];
			}
			else{
				NSLog(@"exit");
				break;
			}

		}

//		testSharedObject();
//		testNSData();
//
//		userDefaultTest *udt = [[userDefaultTest alloc]init];
//		[udt test1];

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
	NSLog(@"NSData(length) %lu", len );
}

