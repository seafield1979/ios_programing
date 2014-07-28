//
//  oc_test2.h
//  objective_c_test1
//
//  Created by 海野 秀祐 on 2013/08/04.
//  Copyright (c) 2013年 海野 秀祐. All rights reserved.
//
// 主にクラスのテスト
//

#import <Foundation/Foundation.h>


// subclass
@interface superclass : NSObject
-(void)method1;
@end
@interface subclass : superclass
-(void)method1;
@end

// protocol
@protocol Protocol01

-(NSString*)protocol_test1;
-(void)protocol_test2:(NSString*)aaa;
-(void)protocol_test3;

@end


@interface oc_test2 : NSObject <Protocol01>

@property (assign) NSString *aaa;


-(void)test01;
@end

// category
// oc_test2を拡張する
@interface NSString (USAdd)

- (NSString*)add01;
- (NSString*)add02;

@end


//ブロック
// ブロックの型の作成する
// 引数を２つ受け取ってBOOLを返すブロック関数
typedef double (^doubleCalc)(double, double);


