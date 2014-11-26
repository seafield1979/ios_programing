//
//  NSObject+PerformBlock.m
//

#import "NSObject+PerformBlock.h"

@implementation NSObject (PerformBlock)

- (void)performBlock:(void (^)())block
{
    block();
}

- (void)performBlock:(void (^)())block afterDelay:(NSTimeInterval)delay
{
    void (^block_)() = [block copy];
    [self performSelector:@selector(performBlock:) withObject:block_ afterDelay:delay];
}
@end
