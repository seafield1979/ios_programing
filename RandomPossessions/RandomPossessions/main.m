//
//  main.m
//  RandomPossessions
//
//  Created by 海野 秀祐 on 2014/03/01.
//  Copyright (c) 2014年 海野 秀祐. All rights reserved.
//

#import <Foundation/Foundation.h>
#import	"Initializer.h"

int main(int argc, const char * argv[])
{

	@autoreleasepool {
	    
	    // insert code here...
	    NSLog(@"Hello, World!");

		NSMutableArray *items = [[NSMutableArray alloc]init];

		[items addObject:@"aaa"];
		[items addObject:@"bbb"];
		[items addObject:@"ccc"];

		[items insertObject:@"zero" atIndex:0];
		items = nil;


#if 1
		Initializer *initializer = [[Initializer alloc]init];
		NSLog(@"%@", initializer);
#endif
	    
	}
    return 0;
}



