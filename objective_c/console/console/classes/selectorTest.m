//
//  selectorTest.m
//  console
//
//  Created by B02681 on 2014/09/08.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import "selectorTest.h"
@implementation selectorSource

- (void)func1
{
    NSLog(@"selectorSource:func1");
}

@end

@implementation selectorTest


-(void)sel1
{
    NSLog(@"sel1");
}

-(void)sel2:(NSString*)str1
{
    NSLog(@"sel2 %@", str1);
}

-(void)sel3:(NSDictionary*)dic
{
    for(NSString* key in [dic allKeys]){
        NSLog(@"sel3 %@ %@", key, dic[key]);
    }
}


/*
 *
 */
- (void)test1
{
    // warningを消すおまじないs
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"

    SEL selector1 = @selector(sel1);
    [self performSelector:selector1];
    
    SEL selector2 = @selector(sel2:);
    [self performSelector:selector2 withObject:@"hello"];
    
    SEL selector3 = @selector(sel3:);
    [self performSelector:selector3 withObject:@{@"key1" : @"aaa", @"key2" : @"bbb", @"key3" : @"ccc" }];
    
    // 他のクラスのメソッドを呼び出す
    selectorSource *source = [[selectorSource alloc]init];
    SEL selector4 = @selector(func1:);
    [self performSelector:selector4 withObject:nil];
    

#pragma clang diagnostic pop
}

@end
