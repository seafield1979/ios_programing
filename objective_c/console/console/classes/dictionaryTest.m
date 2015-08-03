//
//  dictionaryTest.m
//  console
//
//  Created by 海野 秀祐 on 2014/07/29.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import "dictionaryTest.h"

@implementation dictionaryTest
{
	NSDictionary *dic1;
	NSMutableDictionary *mdic1;
}

- (void)test1
{
	// 生成
	dic1 = [[NSDictionary alloc]initWithObjectsAndKeys:
				@"val1", @"key1",
				@"val2", @"key2",
				@"val3", @"key3", nil];
	mdic1 = [[NSMutableDictionary alloc]initWithObjectsAndKeys:
				@"val4", @"key4",
				@"val5", @"key5",
				@"val6", @"key6", nil];
	NSDictionary *dic2 = @{@"key7": @"val7", @"key8" : @"val8", @"key9": @"val9"};
	// 参照
	NSString *str1 = [dic1 objectForKey:@"key1"];
	NSString *str2 = [dic2 objectForKey:@"key7"];
	NSString *str3 = [mdic1 objectForKey:@"key5"];
	NSLog(@"str1:%@ str2:%@ str3:%@", str1, str2, str3);

	// 追加
	[mdic1 setObject:@"val10" forKey:@"key10"];
	NSLog(@"mdic1: %@", mdic1);

	// 削除
	[mdic1 removeObjectForKey:@"key5"];
	NSLog(@"mdic1: %@", mdic1);

	// 全部参照
	for(NSString *key in [dic1 allKeys]){
		NSLog(@"dic1 %@ : %@", key, [dic1 objectForKey:key]);
	}
}

- (void)test2
{
    NSMutableDictionary *params = @{}.mutableCopy;
    params[@"aaa"] = @"hoge";     //OK
    [params setObject:@"hoge" forKey:@"key1"];      // OK
    
    
    NSLog(@"%@", params);
    NSLog(@"%@", params[@"hidden"]);
    
    NSDictionary *params2 = nil;
    if (params2[@"key"] == nil) {
        NSLog(@"params2 ok");
    }
    
    
    //範囲外の参照
    NSDictionary *dic2 = @{@"111":@{@"222":@[@"ok",@"ng",@"yea"]}};
    
    NSLog(@"%@ %@", dic2[@"111"][@"222"][0],dic2[@"111"][@"222"][1]);
    NSArray *arr2 = dic2[@"111"][@"222"];
    if (arr2.count > 2){
        NSLog(@"%@", dic2[@"111"][@"222"][2]);
    }
}

@end
