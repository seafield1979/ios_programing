//
//  blockTest.h
//  console
//
//  Created by 海野 秀祐 on 2014/08/02.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface blockTest : NSObject

-(void)test1;

// ブロックの型の作成する
typedef double (^doubleBlock)(double, double);
typedef float (^floatBlock)(float, float);
typedef int (^intBlock)(int, int);
typedef NSString* (^stringBlock)(NSString*, NSString*);

// 引数としてブロックを受け取るメソッド
-(int)intBlockFunc1:(intBlock)block1;
-(float)floatBlockFunc1:(floatBlock)block1;

@end
