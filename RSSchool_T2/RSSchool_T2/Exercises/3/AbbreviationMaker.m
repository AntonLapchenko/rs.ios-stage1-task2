#import "AbbreviationMaker.h"

@implementation AbbreviationMaker
// Complete the abbreviation function below.
- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {
    NSMutableString *capitalizedString = [[a uppercaseString] mutableCopy];
    NSUInteger numOfLetterInB = 0;
    NSMutableString *resultString = [NSMutableString new];
    for (NSUInteger i = 0; i < a.length; i ++) {
        if (numOfLetterInB >= [b length]) {
            break;
        }
        if([capitalizedString characterAtIndex:i] == [b characterAtIndex:numOfLetterInB]) {
            [resultString appendFormat:@"%c",[capitalizedString characterAtIndex:i]];
            numOfLetterInB ++;
        }
    } if ([resultString isEqual:b]) {
        return  @"YES";
    } else {
        return @"NO";
    }
}
@end
