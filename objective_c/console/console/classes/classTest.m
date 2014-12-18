//
//  classTest.m
//  console
//
//  Created by 海野 秀祐 on 2014/08/02.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import "classTest.h"

@implementation parentClass

-(id)init
{
	self = [super init];
	if(self){
		self.name = @"name1";
	}
	return self;
}

-(void)print
{
	NSLog(@"parentClass name %@", self.name);
}

// override
-(void)dealloc
{
    NSLog(@"parentClass dealloc");
}

@end


@implementation childClass

-(id)init
{
	self = [super init];
	if(self){
		self.name = @"child_name1";
	}
	return self;
}

// override
-(void)print
{
    [super print];
	NSLog(@"childClass child_name %@", self.name);
}

// override
-(void)dealloc
{
    NSLog(@"childClass dealloc");
}

@end

@interface classTest ()

@property (nonatomic, strong) parentClass *parent;
@property (nonatomic, strong) childClass *child;

@end

@implementation classTest

- (void)test
{
    self.parent = [[parentClass alloc]init];
    self.child = [[childClass alloc]init];
    
    [self.parent print];
    [self.child print];
    
    self.parent = nil;
    self.child = nil;
}

@end

