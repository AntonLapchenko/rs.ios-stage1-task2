#import "Blocks.h"

@interface Blocks ()

@property (nonatomic, copy) NSArray *array;
@property (nonatomic, copy) Class class;

@end

@implementation Blocks

- (BlockA)blockA {
    return [^(NSArray *array) {
        self.array = [array copy];
    } copy];
}

- (BlockB)blockB {
    return [^(Class class) {
        self.class = class;
        NSMutableArray *array = [self.array mutableCopy];
        if (class == [NSString class]) {
            NSString *result = @"";
            for (NSObject *item in array) {
                if ([item isKindOfClass:class]) {
                    result = [result stringByAppendingString:(NSString *)item];
                }
            };
            self.blockC(result);
        } else if (class == [NSNumber class]) {
            NSInteger result = 0;
            for (NSObject *item in self.array) {
                if ([item isKindOfClass:class]) {
                    result += [(NSNumber *)item intValue];
                }
            }
            self.blockC([[NSNumber alloc] initWithInteger:result]);
        } else  {
            NSTimeInterval result = 0;
            for (NSObject *elem in self.array) {
                if ([elem isKindOfClass:class]) {
                    NSTimeInterval timeInterval = [(NSDate *)elem timeIntervalSince1970];
                    if (timeInterval > result) {
                        result = timeInterval;
                    };
                }
            }
            NSDateFormatter *dateFormatter = [NSDateFormatter new];
            [dateFormatter setDateFormat:@"dd.MM.yyyy"];
            self.blockC([dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970: result]]);
        }
    }copy];
}

@end
