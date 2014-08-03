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
#import "blockTest.h"
#import "dataTest.h"
#import "dateTest.h"
#import "categoryTest.h"
#import "protocolTest.h"
#import "urlTest.h"

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
			else if(0 == strcmp((const char*)cmd_buf, "block1")){
				blockTest *bt = [[blockTest alloc]init];
				[bt test1];
			}
			else if(0 == strcmp((const char*)cmd_buf, "data1")){
				dataTest *dt = [[dataTest alloc]init];
				[dt test1];
			}
			else if(0 == strcmp((const char*)cmd_buf, "data2")){
				dataTest *dt = [[dataTest alloc]init];
				[dt test2];
			}
			else if(0 == strcmp((const char*)cmd_buf, "date1")){
				dateTest *dt = [[dateTest alloc]init];
				[dt test1];
			}
			else if(0 == strcmp((const char*)cmd_buf, "category1")){
				categoryTest *ct = [[categoryTest alloc]init];
				[ct test1];
			}
			else if(0 == strcmp((const char*)cmd_buf, "protocol")){
				protocolTest *pt = [[protocolTest alloc]init];
				[pt test1];
			}
			else if(0 == strcmp((const char*)cmd_buf, "url1")){
				urlTest *ut = [[urlTest alloc]init];
				[ut test1];
			}
			else if(0 == strcmp((const char*)cmd_buf, "singleton")){
				testSharedObject();
			}
			else{
				NSLog(@"exit");
				break;
			}

		}
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

