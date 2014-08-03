//
//  arrayTest.h
//  console
//
//  Created by 海野 秀祐 on 2014/07/29.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface arrayTest : NSObject

@property (nonatomic, strong) NSArray *arr1;
@property (nonatomic, strong) NSMutableArray *marr1;

-(void)test1;	// NSArrayテスト
-(void)test2;	// NSMutableArrayテスト

@end
