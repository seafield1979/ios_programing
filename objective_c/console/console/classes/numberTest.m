//
//  numberTest.m
//  console
//
//  Created by B02681 on 2015/03/11.
//  Copyright (c) 2015年 海野 秀祐. All rights reserved.
//
/*
    NSNumberはいろいろなタイプの値が入る BOOL, int, float, double, char等
    このクラスはあくまで値を保持するだけなので、演算等の処理を行う場合は元の形に変換してから行う。
 
 */

#import "numberTest.h"

@implementation numberTest

- (void)test1
{
    // オブジェクト作成
    NSNumber *hoge1 = [NSNumber numberWithInteger:100];
    NSNumber *hoge2 = @(200);           // モダンな書き方
    NSLog(@"%@ %@", hoge1, hoge2);
    
    // プリミティブ型を取り出す
    NSNumber *int1 = @(100);
    NSNumber *float1 = @(1.2345);
    NSNumber *bool1 = @(YES);

    NSInteger int2 = int1.integerValue;
    CGFloat float2 = float1.floatValue;
    BOOL bool2 = bool1.boolValue;
    NSLog(@"%ld %f %d", int2, float2, bool2);
    
    // 値の比較
    NSComparisonResult c = [@(100.0) compare:@(100)];
    switch(c){
        case NSOrderedAscending:    //「num1 ＜ num2」の状態
            NSLog(@"num1 ＜ num2");
            break;
        case NSOrderedSame:         //「num1 == num2」の状態
            NSLog(@"num1 == num2");
            break;
        case NSOrderedDescending:   //「num1 ＞ num2」の状態
            NSLog(@"num1 ＞ num2");
            break;
    }
    NSNumber *num1 = @(100);
    NSNumber *num2 = @(100.0);
    if (num1 == num2){
        NSLog(@"ok");
    }
}

- (void)test2
{
    
}

@end
