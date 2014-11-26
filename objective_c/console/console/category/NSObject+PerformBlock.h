//
//  NSObject+PerformBlock.h
//

#import <Foundation/Foundation.h>

@interface NSObject (PerformBlock)

- (void)performBlock:(void (^)())block;

- (void)performBlock:(void (^)())block afterDelay:(NSTimeInterval)delay;
@end
