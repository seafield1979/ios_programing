//
//  userDefaultTest.m
//  console
//
//  Created by 海野 秀祐 on 2014/07/30.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import "userDefaultTest.h"

@implementation userDefaultTest
-(void)init1
{

}

/*
 未設定のUserDefaultのキーに初期値を設定する
 */
-(void)setDefault
{
	NSLog(@"useDefaultTest::setDefault");

	NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];  // 取得
	NSMutableDictionary *defaults = [NSMutableDictionary dictionary];
	[defaults setObject:@"99" forKey:@"KEY_I"];
	[defaults setObject:@"99.99" forKey:@"KEY_F"];
	[defaults setObject:@"88.88" forKey:@"KEY_D"];
	[defaults setObject:@"YES" forKey:@"KEY_B"];
	[defaults setObject:@"hoge" forKey:@"KEY_S"];

	[ud registerDefaults:defaults];
}

/*
 UserDefaultに値を設定する
 */
-(void)save1
{
	NSLog(@"userDefaultTest::save1");
	NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];  // 取得

	// setObjectで値を書き込む、書き込む値はNSObject型のサブクラス
	[ud setObject:@"1" forKey:@"KEY_I"];
	[ud setObject:@"2.0" forKey:@"KEY_F"];
	[ud setObject:@"3.000" forKey:@"KEY_D"];
	[ud setObject:@"NO" forKey:@"KEY_B"];
	[ud setObject:@"syutaro" forKey:@"KEY_S"];

	[ud synchronize];
}

/*
 UserDefaultにNSDictionaryのデータを設定する
 */
-(void)save2
{
	NSLog(@"userDefaultTesst::save2");
	NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];  // 取得
	NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"value1", @"key1", @"value2", @"key2", nil];
	[ud setObject:dic forKey:@"dictionary1"];
	[ud synchronize];
}

/*
 NSUserDefaultの値を読み込む
 */
-(void)load1
{
	NSLog(@"userDefaultTest::load1");
	NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];  // 取得

	// integerForKey, floatForKey, doubleForKey, boolForKey 等の読み込みメソッドを使用して値を読み込むs
	int i    = (int)[ud integerForKey:@"KEY_I"];
	float f  = [ud floatForKey:@"KEY_F"];
	double d = [ud doubleForKey:@"KEY_D"];
	BOOL b   = [ud boolForKey:@"KEY_B"];
	NSString *s = [ud stringForKey:@"KEY_S"];

	NSLog(@"%d %f %f %d %@", i, f, d, b, s);
}

// 辞書型をロードする
-(void)load2
{
	NSLog(@"userDefaultTest::load2");
	NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];  // 取得
	NSDictionary *dic = [ud dictionaryForKey:@"dictionary1"];

	NSArray *keys = [dic allKeys];
	for(NSString *key in keys){
		NSLog(@"key=%@ value=%@", key, [dic objectForKey:key]);
	}
}

-(void)delete1
{
	NSLog(@"userDefaultTest::delete1");
	NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];  // 取得
	[ud removeObjectForKey:@"KEY_I"];
	[ud removeObjectForKey:@"KEY_F"];
	[ud removeObjectForKey:@"KEY_D"];
	[ud removeObjectForKey:@"KEY_B"];
	[ud removeObjectForKey:@"KEY_S"];

	[ud synchronize];
}

-(void)test1
{
//	[self save2];
//	[self load2];
}

@end
