//
//  propertyTest.m
//  console
//
//  Created by UnnoShusuke on 2014/09/11.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import "propertyTest.h"
#import "NSObject+retainCount.h"

#pragma mark - property1

@implementation property1


-(void)dealloc
{
    NSLog(@"dealloc");
}

-(NSString*)description
{
    return [NSString stringWithFormat:@"property1"];
}

@end


#pragma mark - getset1

@implementation getset1
@end


#pragma mark - propertyTest


@interface propertyTest()
{
}
@property (weak, nonatomic) property1 *weak1;
@property (weak, nonatomic) property1 *weak2;

@property (strong, nonatomic) property1 *strong1;
@property (strong, nonatomic) property1 *strong2;
@property (strong, nonatomic) property1 *strong3;

@property (strong, nonatomic) getset1 *gs1;

@property (strong) NSString *myStr1;
@property (strong, nonatomic) NSString *myName;

@property (strong) NSString *dynamic1;

// 名前
//@property (nonatomic, strong, getter=myName, setter=setMyName:) NSString *name;

@end



#pragma mark - propertyTest

@implementation propertyTest

@synthesize myName = _myName;
@synthesize gs1 = _gs1;
@synthesize dynamic1 = _dynamic1;

//@dynamic dynamic1;          // dynamic1はプロパティ宣言されているがgetter、setterは作られない

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

/*
 * myName のアクセッサー
 */
- (NSString *)myName
{
    return [NSString stringWithFormat:@"%@ 様", _myName];
}
- (void)setMyName:(NSString *)myName
{
    _myName = myName;
}

/*
 * myStr1 のアクセッサー
 */
-(NSString*)myStr1{
    return self.myStr1;
}
-(void)setMyStr1:(NSString *)myStr1
{
    self.myStr1 = myStr1;
}

/*
 * dynamic1のアクセッサー
 */
-(NSString*)dynamic1
{
    return _dynamic1;
}

-(void)setDynamic1:(NSString *)dynamic1
{
    _dynamic1 = dynamic1;
}

-(void)test1
{
    self.strong1 = [[property1 alloc]init];
    NSLog(@"%d", (int)[self.strong1 referenceCount]);  // 1
    self.strong2 = self.strong1;
    NSLog(@"%d", (int)[self.strong1 referenceCount]);  // 2
    self.weak1 = _strong1;
    NSLog(@"%d", (int)[self.strong1 referenceCount]);  // 2
    self.strong2 = nil;
    NSLog(@"%d", (int)[self.strong1 referenceCount]);  // 1
    self.strong1 = nil;   // dealloc
    NSLog(@"%d", (int)[self.strong1 referenceCount]);  // 0
    NSLog(@"%@", self.weak1);
    
    self.gs1 = [[getset1 alloc]init];
    NSLog(@"%@", self.gs1);
    
    self.myName = @"myname";
    NSLog(@"%@", _myName);          // myname
    NSLog(@"%@", self.myName);      // myname 様
    
    // weakプロパティの解放
//    self.weak2 = [[property1 alloc]init];      // retainされるオブジェクトに設定しろというエラーが出る
    self.strong3 = [[property1 alloc]init];
    self.weak1 = self.strong3;
    NSLog(@"weak %@", self.weak1);  // weak property1
    
    self.strong3 = nil;             // strong3が保持していたオブジェクトはここで解放される
    NSLog(@"weak %@", self.weak1);  // weak (null)
    
    
    // dynamicテスト
    self.dynamic1 = @"dynamic1";
    NSLog(@"dynamic test: %@", self.dynamic1);
    
    
}


@end
