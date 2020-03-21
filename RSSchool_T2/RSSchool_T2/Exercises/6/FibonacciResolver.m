#import "FibonacciResolver.h"

@implementation FibonacciResolver
- (NSArray*)productFibonacciSequenceFor:(NSNumber*)number {
    NSInteger total = 0;
    NSInteger prev = 1;
    while (total * prev < [number integerValue] ) {
        total = total + prev;
        prev = total - prev;
        if (total * prev == [number integerValue]){
            return @[@(prev), @(total), @(1)];
        }
        if (total * prev > [number integerValue]) {
            return @[@(prev), @(total), @(0)];
        }
    }
    return @[];
}
@end
