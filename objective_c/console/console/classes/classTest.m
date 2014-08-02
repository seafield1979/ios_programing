//
//  classTest.m
//  console
//
//  Created by 海野 秀祐 on 2014/08/02.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import "classTest.h"

@implementation classTest

-(id)init
{
	self = [super init];
	if(self){
		self->name = @"name1";
		self->protected_name = @"protected_name1";
		self->private_name = @"private_name1";
	}
	return self;
}

-(void)print
{
	NSLog(@"classTest::print");
	NSLog(@"name %@", name);
	NSLog(@"protected_name %@", self->protected_name);
	NSLog(@"private_name %@", private_name);
}
-(void)print : (int)val val2:(NSString *)val2
{
	NSLog(@"print2 %d %@", val, val2);
}
@end

#pragma mark hogehoge


@implementation classTest2
-(id)init
{
	self = [super init];
	if(self){
		child_name = @"child_name1";
	}
	return self;
}
-(void)print
{
	NSLog(@"classTest2::print");
	NSLog(@"protected_name %@", protected_name);
	NSLog(@"child_name %@", child_name);
}

@end

@implementation initTest

- (id) initWithAllParams:(int)val1 val2:(int)val2 val3:(int)val3
{
	self = [super init];
	self->value1 = val1;
	self->value2 = val2;
	self->value3 = val3;
	return self;
}
- (id) initWithValue1:(int)val1
{
	return [self initWithAllParams:val1 val2:0 val3:0];
}
- (id) init
{
	return [self initWithAllParams:0 val2:0 val3:0];
}

- (void)print
{
	NSLog(@"initTest::print");
	NSLog(@"%d %d %d", value1, value2, value3);
}

@end


