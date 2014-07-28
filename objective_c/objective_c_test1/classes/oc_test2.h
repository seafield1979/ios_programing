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


@protocol Protocol01

-(NSString*)get_aaa;
-(void)set_aaa:(NSString*)aaa;

@end

@interface oc_test2 : NSObject <Protocol01>

@property (assign) NSString *aaa;


-(void)test01;
@end

@interface oc_test2 (OCTest2Addition)

- (void)add01;
- (void)add02;

@end
