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

    // 2つのNSDateの日付を比較
    // NSDate同士の比較はできないため、フォーマット関数で日時の文字列に返還後文字列で比較する
    NSDate *dt41 = [[NSDate alloc]initWithString:@"2015-01-09 15:00:00 +0900"];
    NSDate *dt42 = [[NSDate alloc]initWithString:@"2015-01-09 21:00:00 +0900"];
    
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    df.dateFormat = @"yyyy/MM/dd";
    NSString *str1 = [df stringFromDate:dt41];
    NSString *str2 = [df stringFromDate:dt42];
    if ([str1 isEqualToString:str2]){
        NSLog(@"same date");
    } else {
        NSLog(@"different date");
    }
    
}

@end
