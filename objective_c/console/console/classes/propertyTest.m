//
//  propertyTest.m
//  console
//
//  Created by UnnoShusuke on 2014/09/11.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import "propertyTest.h"
#import "NSObject+retainCount.h"

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
@property (strong, nonatomic) NSString *myName;

// 名前
//@property (nonatomic, strong, getter=myName, setter=setMyName:) NSString *name;

@end


@implementation propertyTest

@synthesize gs1 = _gs1;
@synthesize myName = _myName;

// ゲッター、セッターをオーバーライド
-(getset1*)gs1
{
    NSLog(@"getGs1");
    return _gs1;
}
//
-(void)setGs1:( getset1 *)gs1
{
    NSLog(@"setGs1");
    _gs1 = gs1;
}

- (NSString *)myName
{
    return [NSString stringWithFormat:@"%@ 様", _myName];
}

-(NSString*)myStr1{
    return self.myStr1;
}
-(void)setMyStr1:(NSString *)myStr1
{
    self.myStr1 = myStr1;
}

- (void)setMyName:(NSString *)name
{
    _myName = name;
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
    
    self.gs1 = [[getset1 alloc]init];
    NSLog(@"%@", self.gs1);
    
    _myName = @"myname";
//    NSLog(@"%@", _myName);        // ng
    NSLog(@"%@", self.myName);      // ok
}


@end
