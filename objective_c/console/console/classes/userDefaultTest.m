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

-(void)save1
{
	NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];  // 取得
	NSMutableDictionary *defaults = [NSMutableDictionary dictionary];
	[defaults setObject:@"99" forKey:@"KEY_I"];  // をKEY_Iというキーの初期値は99
	[defaults setObject:@"99.99" forKey:@"KEY_F"];  // をKEY_Fというキーの初期値は99.99
	[defaults setObject:@"88.88" forKey:@"KEY_D"];  // をKEY_Dというキーの初期値は88.88
	[defaults setObject:@"YES" forKey:@"KEY_B"];  // をKEY_Bというキーの初期値はYES
	[defaults setObject:@"hoge" forKey:@"KEY_S"];  // をKEY_Sというキーの初期値はhoge
	[ud registerDefaults:defaults];
}

-(void)load1
{
	NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];  // 取得
	int i = (int)[ud integerForKey:@"KEY_I"];  // KEY_Iの内容をint型として取得
	float f = [ud floatForKey:@"KEY_F"];  // KEY_Fの内容をfloat型として取得
	double d = [ud doubleForKey:@"KEY_D"];  // KEY_Dの内容をdouble型として取得
	BOOL b = [ud boolForKey:@"KEY_B"];  // KEY_Bの内容をBOOL型として取得
	NSString *s = [ud stringForKey:@"KEY_S"];  // KEY_Sの内容をNSString型として取得

	NSLog(@"%d %f %f %d %@", i, f, d, b, s);
}

@end
