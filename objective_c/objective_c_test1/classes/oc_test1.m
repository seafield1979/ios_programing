//
//  oc_test1.m
//  objective_c_test1
//
//  Created by 海野 秀祐 on 2013/08/04.
//  Copyright (c) 2013年 海野 秀祐. All rights reserved.
//
// Objective-Cの基本クラスのテスト

#import "oc_test1.h"

// NSArrayを表示する
void dispArray(NSString *title, NSArray* array)
{
	int cnt=0;
	for(id obj in array) {
		NSLog(@"%@: %d %@",title, cnt, obj);
		cnt++;
	}
}

// NSDictionaryを表示する
void dispDictionary(NSString *title, NSDictionary *dictionary1)
{
	for(NSString *key in [dictionary1 allKeys]){
		NSLog(@"%@: %@ %@", title, key, [dictionary1 objectForKey:key]);
	}
}


@implementation oc_test1

-(void)test01
{
	//[self test_nsobject];
	[self test_nsstring];
	//[self test_nsnumber];
	//[self test_nsset];
	//[self test_nsdata];
	//[self test_nsarray];
	//[self test_nsdictionary];
	//[self test_memory];
	//[self test_selector];
}


// NSObject
-(void)test_nsobject
{
	// オブジェクトが指定クラス、もしくはサブクラスかを判定する
	// ※isMemberOfClassは同じクラスかどうかの判定には使用できない
	{
		NSMutableArray *marray1 = [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3", nil];
		if ([marray1 isKindOfClass:[NSArray class]]){
			NSLog(@"marray1 is subclass of NSArray");
		}
		else {
			NSLog(@"marray1 isn't subclass of NSArray");
		}

		if ([marray1 isKindOfClass:[NSDictionary class]]){
			NSLog(@"marray1 is subclass of NSDictionary");
		}
		else {
			NSLog(@"marray1 isn't subclass of NSDictionary");
		}
	}
}

// NSStringのテスト
-(void)test_nsstring
{
	NSLog(@"--------------------------test_nsstring");
	// 生成のあれこれ
	{
		// NSStringリテラルから生成
		NSString *str1 = @"test";
		NSLog(@"str1 :%@", str1);

		// char*文字列から生成
		char *str_c = "test12";
		NSString *str12 = [[NSString alloc]initWithBytes:str_c length:strlen(str_c) encoding:NSUTF8StringEncoding];
		NSLog(@"str12 :%@", str12);

		// フォーマット指定で生成
		NSString *str13 = [[NSString alloc]initWithFormat:@"%@",@"str13"];
		NSLog(@"str13 :%@", str13);

		// NSString*のコピーから生成
		NSString *str14 = [[NSString alloc]initWithString:@"test14"];
		NSLog(@"str14 :%@", str14);
	}

	// NSMutableStringのあれこれ
	{
		NSMutableString *mstr1 = [[NSMutableString alloc]initWithString:@"mstr1"];

		// NSStringオブジェクトを追加
		[mstr1 appendString:@" appendString"];
		NSLog(@"%@", mstr1);

		// フォーマット指定で追加
		[mstr1 appendFormat:@" add %d", 100];
		NSLog(@"%@", mstr1);
	}

	// 汎用
	{
		// 文字列の長さを取得
		NSLog(@"length:%d", [@"test123" length]);

		// 文字列の結合
		NSString *str31 = @"str31";
		NSString *str32 = [str31 stringByAppendingString:@" append"];
		NSLog(@"str32 is %@", str32);

		// 切り出し
		NSString *str33 = @"1234567890";
		NSString *str34 = [str33 substringFromIndex:5];
		NSString *str35 = [str33 substringToIndex:5];
		NSString *str36 = [str33 substringWithRange:NSMakeRange(3,4)];
		NSLog(@"str34 %@\n str35 %@\n str36 %@", str34, str35, str36);

		// 検索
		NSString *str41 = @"My name is Syutaro";
		NSRange range41 = [str41 rangeOfString:@"is"];
		NSLog(@"range41 location:%d length:%d", range41.location, range41.length);

	}

	// 比較
	{
		NSString *str5 = @"syutaro";

		// 完全一致
		BOOL ret = [str5 isEqualToString:@"syutaro"];
		if (ret) {
			NSLog(@"str5 is syutaro");
		}
		else {
			NSLog(@"str5 isn't syutaro");
		}

		// 文字列が含まれているか判定
		NSRange range5 = [str5 rangeOfString:@"taro"];
		if (range5.location != NSNotFound) {
			NSLog(@"str5 has taro");
		}
		else {
			NSLog(@"str5 doesn't has taro");
		}

		// 先頭一致を判定
		ret = [str5 hasPrefix:@"syu"];
		if(ret){
			NSLog(@"str5 starts by syu");
		}
		else {
			NSLog(@"str5 doesn't starts by syu");
		}

		// 末尾一致を判定
		ret = [str5 hasSuffix:@"taro"];
		if(ret){
			NSLog(@"str5 end by taro");
		}
		else {
			NSLog(@"str5 doesn't end by taro");
		}
	}
	// 正規表現
	{
		NSString *string = @"aaa     ; http://stg.ameba-oogiri.jp/sp/twitter/boke_from_twitter?bokeId=1234  OK";
		NSError *error   = nil;
		NSRegularExpression *regexp = [NSRegularExpression regularExpressionWithPattern:@"(http://.+) "
												  options:0
													error:&error];
		if (error != nil) {
			NSLog(@"%@", error);
		} else {
			NSTextCheckingResult *match =
			[regexp firstMatchInString:string options:0 range:NSMakeRange(0, string.length)];
			NSLog(@"%d", match.numberOfRanges); // 3のはず
			NSLog(@"%@", [string substringWithRange:[match rangeAtIndex:0]]); // マッチした文字列全部
			NSLog(@"%@", [string substringWithRange:[match rangeAtIndex:1]]); // "正規表現"
			NSLog(@"%@", [string substringWithRange:[match rangeAtIndex:2]]); // "大丈夫だ、問題ない"
		}

	}
}

// NSNumberのテスト
-(void)test_nsnumber
{
	// NSNumberオブジェクトの生成
	{
		// short型→NSNumber型
		NSNumber *num = [NSNumber numberWithShort:32767];
		NSLog(@"num: %@", num);

		// int型→NSNumber型
		num = [NSNumber numberWithInt:2147483647];
		NSLog(@"num: %@", num);

		// long型→NSNumber型
		num = [NSNumber numberWithLong:2147483647];
		NSLog(@"num: %@", num);

		// float型→NSNumber型
		num = [NSNumber numberWithFloat:42.195f];
		NSLog(@"num: %@", num);

		// double型→NSNumber型
		num = [NSNumber numberWithDouble:3.1415f];
		NSLog(@"num: %@", num);

		// BOOL型→NSNumber型
		num = [NSNumber numberWithBool:YES];
		NSLog(@"num: %@", num);

		// char型→NSNumber型
		num = [NSNumber numberWithChar:'a'];
		NSLog(@"num: %@", num);
	}

	// NSNumberから各型に変換
	{
		NSNumber *num2 = [NSNumber numberWithInt:12345];
		NSString *str1 = [num2 stringValue];
		NSLog(@"str1 %@", str1);

		int int1 = [num2 intValue];
		NSLog(@"int1 %d", int1);

		float f1 = [num2 floatValue];
		NSLog(@"f1 %f", f1);
	}

	// 比較
	NSNumber *num1 = [NSNumber numberWithInt:100];
	NSNumber *num2 = [NSNumber numberWithInt:200];

	NSComparisonResult ret = [num1 compare:num2];
	if (ret == NSOrderedAscending) {
		NSLog(@"num1 < num2");
	}
	else if (ret == NSOrderedSame) {
		NSLog(@"num1 == num2");
	}
	else {
		NSLog(@"num1 < num2");
	}
}

// NSSetのテスト
-(void)test_nsset
{
	// NSSet
	// 要素の重複がないコレクション、変更不可
	{
		// 初期化いろいろ
		NSSet *set1 = [[NSSet alloc]initWithObjects:@"1",@"2",@"3", nil];
		for(NSString *str in [set1 allObjects]){
			NSLog(@"str1 %@", str);
		}

		NSSet *set2 = [NSSet setWithObjects:@"11",@"22",@"33",@"33", nil];
		for(NSString *str in [set2 allObjects]){
			NSLog(@"str2 %@", str);
		}
	}

	// 件数取得
	NSSet *set3 = [NSSet setWithObjects:@"1", @"2", @"3", @"1", nil];
	NSLog(@"set3 count:%d", [set3 count]);

	// 指定した要素が存在するかをチェックする
	if ([set3 containsObject:@"1"]) {
		NSLog(@"set3 contains '1'");
	}
	else {
		NSLog(@"set3 doesn't contains '1'");
	}
}

// NSDataのテスト
// バイナリデータを扱うクラス
-(void)test_nsdata
{
	// データの読み出し
	{
		NSString *path = [[NSBundle mainBundle] pathForResource:@"data1" ofType:@"dat"];
		NSData *data1 = [[NSData alloc]initWithContentsOfFile:path];
		NSLog(@"data1 length: %d", [data1 length]);

		int len = [data1 length];

		// byte配列を取得

		// コピーしないで使用する
		unsigned char *bytes0 = (unsigned char *)[data1 bytes];
		for(int cnt=0; cnt < len; cnt++) {
			NSLog(@"bytes0 %d %d", cnt, bytes0[cnt]);
		}

		// コピーして使用する1
		unsigned char *bytes1 = malloc(len);
		memcpy(bytes1, [data1 bytes], len);
		for(int cnt=0; cnt < len; cnt++) {
			NSLog(@"bytes1 %d %d", cnt, bytes1[cnt]);
		}
		free(bytes1);

		// コピーして使用する2
		unsigned char *bytes2 = malloc(len*2);
		bytes2[0] = 1;
		[data1 getBytes:bytes2 length:len];
		for(int cnt=0; cnt < len; cnt++) {
			NSLog(@"bytes2 %d %d", cnt, bytes2[cnt]);
		}
		free(bytes2);

	}

	// データ書き出し
	{
		// 書き込みデータ作成
		NSString* a_home_dir = NSHomeDirectory();
		NSString* a_doc_dir = [a_home_dir stringByAppendingPathComponent:@"Documents"];
		NSString* a_file_path = [a_doc_dir stringByAppendingPathComponent:@"test.txt"];

		if (true) {
			unsigned char bytes1[] = {49,50,51,52,53,54};
			NSData *data1 = [[NSData alloc]initWithBytes:bytes1 length:sizeof(bytes1)];
			NSLog(@"data1 length: %d", [data1 length]);

			// 書き込み
			NSString *path = @"data2.txt";
			if([data1 writeToFile:a_file_path atomically:YES]) {
				NSLog(@"success");
			}
			else {
				NSLog(@"failed");
			}
		}

		// 読み込み
		NSData *data2 = [[NSData alloc]initWithContentsOfFile:a_file_path];
		int len = [data2 length];
		unsigned char *bytes0 = (unsigned char *)[data2 bytes];
		for(int cnt=0; cnt < len; cnt++) {
			NSLog(@"bytes0 %d %d", cnt, bytes0[cnt]);
		}
	}
}

// NSArray, NSMutableArrayのテスト
-(void)test_nsarray
{
	// NSArray
	{
		// 初期化いろいろ
		NSArray *array1 = [[NSArray alloc]initWithObjects:@"1", @"2", @"3", nil];
		dispArray(@"array1", array1);

		NSArray *array2 = [NSArray arrayWithObjects:@"11",@"22",@"33", nil];
		dispArray(@"array2", array2);

		// 取得いろいろ
		// 要素番号を指定して取得
		NSString *str1 = [array1 objectAtIndex:0];
		NSLog(@"str1 %@", str1);

		// 最後の要素を取得
		NSString *str_last = [array1 lastObject];
		NSLog(@"str_last %@", str_last);

		// ある要素が含まれているかをチェック
		BOOL ret = [array1 containsObject:@"2"];
		if (ret) {
			NSLog(@"array1 contains 2");
		}
		else {
			NSLog(@"array1 doesn't contains 2");
		}

		// 要素数を取得
		NSArray *array3 = [NSArray arrayWithObjects:@"aa", @"bb", @"cc", nil];
		int array_cnt = [array3 count];
		NSLog(@"array3 count %d", array_cnt);
	}

	// NSMutableArray
	{
		// 初期化いろいろ
		NSMutableArray *marray1 = [[NSMutableArray alloc]initWithObjects:@"1", @"2", @"3", nil];
		dispArray(@"marray1", marray1);

		NSMutableArray *marray2 = [NSMutableArray arrayWithObjects:@"11",@"22",@"33", nil];
		dispArray(@"marray2", marray2);

		NSMutableArray *marray3 = [[NSMutableArray alloc]init];
		dispArray(@"marray3", marray3);

		NSMutableArray *marray32 = [NSMutableArray array];
		dispArray(@"marray32", marray32);

		// 追加
		NSMutableArray *marray4 = [NSMutableArray arrayWithArray:marray1];
		[marray4 addObject:@"4"];
		dispArray(@"marray4", marray4);

		// 位置指定で追加
		[marray4 insertObject:@"21" atIndex:1];
		dispArray(@"marray42", marray4);

		// 削除
		NSMutableArray *marray5 = [NSMutableArray arrayWithArray:marray1];
		[marray5 removeObjectAtIndex:0];
		dispArray(@"marray5", marray5);

		// 最後の要素を削除
		[marray5 removeLastObject];
		dispArray(@"marray52", marray5);

		// 全削除
		NSMutableArray *marray6 = [NSMutableArray arrayWithArray:marray1];
		[marray6 removeAllObjects];
		dispArray(@"marray6", marray6);
	}
}

// NSDictionary, NSMutableDictionaryのテスト
-(void)test_nsdictionary
{
	// NSDictionary
	{
		// 初期化いろいろ
		// 値とキーを交互に与えて生成
		NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:@"111", @"key1",
							  @"222", @"key2", nil];
		dispDictionary(@"dic1", dic1);

		// 値のArrayとキーのArrayから生成
		NSArray *values1 = [NSArray arrayWithObjects:@"1", @"2", @"3", nil];
		NSArray *keys1 = [NSArray arrayWithObjects:@"key1", @"key2", @"key3", nil];
		NSDictionary *dic2 = [NSDictionary dictionaryWithObjects:values1 forKeys:keys1];
		dispDictionary(@"dic2", dic2);


		// 要素を取り出す
		NSString *str1 = [dic1 objectForKey:@"key2"];
		NSLog(@"dic1 key2 is %@", str1);

		// すべてのキーを取得する
		NSArray *keys2 = [dic1 allKeys];
		dispArray(@"keys2", keys2);

		// すべての値を取得する
		NSArray *values2 = [dic2 allValues];
		dispArray(@"values2", values2);
	}

	// NSMutableDictionary
	{
		// 初期化いろいろ
		// 空の要素で初期化
		NSMutableDictionary *mdic1 = [NSMutableDictionary dictionary];
		[mdic1 setObject:@"111" forKey:@"key1"];
		dispDictionary(@"mdic1", mdic1);

		// 初期値を指定して初期化
		NSMutableDictionary *mdic2 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
									  @"111", @"key1",
									  @"222", @"key2", nil];
		dispDictionary(@"mdic2", mdic2);

		// 要素を追加
		[mdic2 setObject:@"333" forKey:@"key3"];
		[mdic2 setObject:@"444" forKey:@"key4"];
		dispDictionary(@"mdic21", mdic2);

		// キーを指定して削除
		NSMutableDictionary *mdic3 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
									  @"aaa", @"key1",
									  @"bbb", @"key2",
									  @"ccc", @"key3",nil];
		[mdic3 removeObjectForKey:@"key2"];
		dispDictionary(@"mdic3", mdic3);

		// すべて削除
		[mdic3 removeAllObjects];
		dispDictionary(@"mdic32", mdic3);

		// 別のDictionaryで上書き
		NSMutableDictionary *mdic4 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
									  @"aaa", @"key1",
									  @"bbb", @"key2",
									  @"ccc", @"key3",nil];
		[mdic4 setDictionary:mdic2];
		dispDictionary(@"mdic4", mdic4);

	}
}

//
// alloc,release,autorelease,retainのテスト
//
-(void)test_memory
{
	// 生成と解放
	// 解放されたくない場合は retain、解放したかったらreleaseする
	NSString *str1 = [[[NSString alloc]init]retain];
	[str1 release];

	// retainカウンタ
	NSObject *obj1 = [[NSObject alloc]init];	// allocした時点で1
	NSLog(@"retain count: %d", [obj1 retainCount]);
	[obj1 retain];			// 1 -> 2
	NSLog(@"retain count: %d", [obj1 retainCount]);
	[obj1 retain];			// 2 -> 3
	NSLog(@"retain count: %d", [obj1 retainCount]);
	[obj1 release];			// 3 -> 2
	NSLog(@"retain count: %d", [obj1 retainCount]);
	[obj1 release];			// 2 -> 1
	NSLog(@"retain count: %d", [obj1 retainCount]);
	// スコープを抜ける（関数を抜ける）ときにretainCountが -1 され0になり解放される

	// autorelease系のメソッドで生成したオブジェクト
	NSArray *array1 = [NSArray arrayWithObjects:@"aaa", nil];
	NSLog(@"array1 retain count: %d", [array1 retainCount]);	// autoretainされているので1になる
	// 解放(retainカウンタを-1する処理)は自動で行われるので不要
	// ただし、array1をずっと保持したい場合は retainする必要がある。

	// コピーオブジェクトのretain
	// コピーオブジェクトに対してのretainやreleaseは
	NSObject *obj2 = [[NSObject alloc]init];
	NSObject *obj3 = obj2;
	NSLog(@"obj2 retain count: %d", [obj2 retainCount]);
	[obj3 retain];	// obj3のコピー元のobj2がretainされる 1->2
	NSLog(@"obj2 retain count: %d", [obj2 retainCount]);
	[obj3 release];	// obj3のコピー元のobj2がreleaseされる 2->1
	NSLog(@"obj2 retain count: %d", [obj2 retainCount]);

	// autoreleaseによるretainカウンタの変化
	NSObject *obj4 = [[NSObject alloc]init];
	NSLog(@"obj4 retain count: %d", [obj4 retainCount]);
	[obj4 autorelease];		// retainCountは変化しない 1->1
	NSLog(@"obj4 retain count: %d", [obj4 retainCount]);

}

// セレクター
// @selecter
-(void)test_selector
{
	NSNumber *val1 = [NSNumber numberWithInt:100];
	NSNumber *val2 = [NSNumber numberWithInt:200];

	// 直接呼び出し performSelector
	// 引数なし
	[self performSelector:@selector(func01)];
	// 引数１個
	[self performSelector:@selector(func02:) withObject:val1];
	// 引数２個
	[self performSelector:@selector(func03:val2:) withObject:val1 withObject:val2];

	// SELクラスを使用した呼び出し
	SEL sel1 = @selector(func01);
	[self performSelector:sel1];

	SEL sel2 = @selector(func02:);
	[self performSelector:sel2 withObject:val1];

	SEL sel3 = @selector(func03:val2:);
	[self performSelector:sel3 withObject:val1 withObject:val2];
	
}
-(void)func01
{
	NSLog(@"func01 was called");
}

-(void)func02:(NSNumber*)val1
{
	NSLog(@"func02 %d", [val1 intValue]);
}

-(void)func03:(NSNumber*)val1 val2:(NSNumber*)val2
{
	NSLog(@"func03 %d %d", [val1 intValue], [val2 intValue]);
}


@end
