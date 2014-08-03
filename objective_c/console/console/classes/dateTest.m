//
//  dateTest.m
//  console
//
//  Created by 海野 秀祐 on 2014/07/30.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import "dateTest.h"

@implementation dateTest

- (void)test1
{
	// 日本時間の時刻を取得する
	NSDate *dt = [NSDate dateWithTimeIntervalSinceNow:[[NSTimeZone systemTimeZone]secondsFromGMT]];
	NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
	fmt.dateFormat = @"yyyy/MM/dd HH:mm:ss";
	NSString *str = [fmt stringFromDate:dt];
	NSLog(@"date: %@", str);

	// 現在時刻で生成例
	NSDate *dt2 = [NSDate date];
	NSLog(@"date2: %@", dt2);

	// 指定した日付・時刻で生成例
	NSDate *dt3 = [[NSDate alloc] initWithString:@"2010-01-01 23:59:59 +0900"];
	NSLog(@"date3: %@", dt3);

	
}

@end
