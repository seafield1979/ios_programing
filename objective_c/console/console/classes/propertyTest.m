//
//  propertyTest.m
//  console
//
//  Created by UnnoShusuke on 2014/09/11.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import "propertyTest.h"
#import "NSObject+retainCount.h"

#define retaincount(count) (int)CFGetRetainCount((__bridge CFTypeRef)count)

//NSInteger getRetainCount(__strong id obj) {
//    return CFGetRetainCount((__bridge CFTypeRef)obj);
//}
//
//void incrementRetainCount(__strong id obj) {
//    CFRetain((__bridge CFTypeRef)obj);
//}
//
//void decrementRetainCount(__strong id obj) {
//    CFRelease((__bridge CFTypeRef)obj);
//}


@implementation property1


-(void)dealloc
{
    NSLog(@"dealloc");
}

@end


@implementation getset1


@end

@interface propertyTest()
{
}
@property (weak, nonatomic) property1 *weak1;
@property (strong, nonatomic) property1 *strong1;
@property (strong, nonatomic) property1 *strong2;
@property (strong) NSString *myStr1;
@property (strong) getset1 *gs1;

@end


@implementation propertyTest

@synthesize gs1 = _gs1;

// ゲッター、セッターをオーバーライド
-(getset1*)gs1
{
    NSLog(@"gs1");
    return _gs1;
}

-(void)setGs1:( getset1 *)gs1
{
    NSLog(@"setGs1");
    _gs1 = gs1;
}

-(void)test1
{
    _strong1 = [[property1 alloc]init];
    NSLog(@"%d", (int)[_strong1 referenceCount]);
    _strong2 = _strong1;
    NSLog(@"%d", (int)[_strong1 referenceCount]);
    _weak1 = _strong1;
    NSLog(@"%d", (int)[_strong1 referenceCount]);
    _strong2 = nil;
    NSLog(@"%d", (int)[_strong1 referenceCount]);
    _strong1 = nil;
    
    _gs1 = [[getset1 alloc]init];
    NSLog(@"%@", _gs1);
}


@end
