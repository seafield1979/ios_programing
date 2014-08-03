//
//  protocolTest.h
//  console
//
//  Created by 海野 秀祐 on 2014/08/02.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Protocol1
// メソッドの定義
-(int)add:(int)a b:(int)b;
-(int)mul:(int)a b:(int)b;
-(void)print;
// 変数の定義
@property (nonatomic, strong) NSString *name;
@end

@interface protocolTest : NSObject <Protocol1>

-(void)test1;
@end
