#import "NSString+Transform.h"

@implementation NSString (Transform)

NSString *const vowelsPattern = @"aeiouy";
NSString *const consonantsPattern = @"bcdfghjklmnpqrstvwxz";
NSString *const letters = @"abcdefghijklmnopqrstuvwxyz";

- (NSString*)transform {
    NSArray *arr = [self componentsSeparatedByString:@" "];
    NSMutableArray *result = [NSMutableArray new];
    for (NSString *word in arr) {
        if ([self isPangram] ) {
            [self logicToTransorm:word for:vowelsPattern andWriteThe:result];
        } else {
            [self logicToTransorm:word for:consonantsPattern andWriteThe:result];
        }
    }
    return [result componentsJoinedByString:@" "];
}

-(NSArray*)logicToTransorm:(NSString *)word for:(NSString *)letter andWriteThe:(NSMutableArray *)result {
    word = [NSString stringWithFormat:@"%lu%@",(unsigned long)[self countOf:letter inA:word], word];
    word = [self addCapitalLetters:letter toThe:word];
    [result addObject:word];
    [self sortConsonants:result byNumberOfLetters:letter];
    if ([word isEqualToString:@"0"]) {
        [result removeObject:word];
    }
    return result;
}

- (BOOL)isPangram {
    NSString *lowercasedText = [[self stringByApplyingTransform:NSStringTransformStripCombiningMarks reverse:NO] lowercaseString];
    for (NSInteger i = 0; i < [letters length]; i++) {
        unichar character = [letters characterAtIndex:i];
        NSString *letter = [NSString stringWithFormat:@"%c", character];
        if (![lowercasedText containsString:letter]) {
            return NO;
        }
    }
    return YES;
}

- (NSUInteger)countOf:(NSString *)letter inA:(NSString *)word {
    NSUInteger counter = 0;
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:[letter lowercaseString]];
    for (NSInteger i = 0; i < [word lowercaseString].length; i++) {
        unichar character = [[word lowercaseString] characterAtIndex:i];
        if ([set characterIsMember:character]) {
            counter++;
        }
    }
    return counter;
}

- (NSString *)addCapitalLetters:(NSString *)letter toThe:(NSString *)word {
    for (NSInteger i = 0; i < [letter length]; i++) {
        NSString *character = [NSString stringWithFormat:@"%C", [letter characterAtIndex:i]];
        word = [word stringByReplacingOccurrencesOfString:character withString:[character uppercaseString]];
    }
    return word;
}

- (NSMutableArray *)sortConsonants:(NSMutableArray *)arr byNumberOfLetters:(NSString *)letter{
    [arr sortUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2) {
        NSUInteger vowels1 = [obj1 countOf:letter inA:obj1];
        NSUInteger vowels2 = [obj2 countOf:letter inA:obj2];
        if (vowels1 > vowels2) {
            return (NSComparisonResult)NSOrderedDescending;
        } if (vowels1 < vowels2) {
            return (NSComparisonResult)NSOrderedAscending;
        } else {
            return (NSComparisonResult)NSOrderedSame;
        }}];
    return arr;
}
@end
