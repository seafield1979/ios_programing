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

@synthesize aaa = _aaa;

-(void)test01
{
	[self test_protocol];
}

-(void)test_instance
{

}

-(void)test_class_method
{

}

// カテゴリー
-(void)test_category
{
	
}

// プロトコルテスト
// Protocol01で定義されたメソッドをすべて実装する
-(void)test_protocol
{
	[self set_aaa:@"aaa"];
	NSString *str1 = [self get_aaa];
	NSLog(@"str1 %@", str1);
}
-(NSString*)get_aaa
{
	return _aaa;
}
-(void)set_aaa:(NSString *)aaa
{
	if (_aaa){
		[aaa release];
	}
	_aaa = [aaa retain];
}

-(void)dealloc
{
	NSLog(@"oc_test02 dealloc");
	[_aaa release];
	[super dealloc];
}


@end


// カテゴリ
@implementation oc_test2 (OCTest2Addition)
-(void)add01
{

}
-(void)add02
{
	
}
@end
