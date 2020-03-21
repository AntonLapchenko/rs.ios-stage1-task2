#import "TimeConverter.h"

@implementation TimeConverter
// Complete the following function
- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {
    NSNumber *minutesValue = [NSNumber numberWithInt:[minutes intValue]];
    NSNumber *hoursValue = [NSNumber numberWithInt:[hours intValue]];
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterSpellOutStyle];
    
    NSString *wordMunutes = [numberFormatter stringFromNumber: minutesValue];
    NSString *wordHours = [numberFormatter stringFromNumber:hoursValue];
    
    if ([minutes intValue] > 60 || [hours intValue] > 12) {
        return @"";
    } if ([minutes intValue] == 00) {
        return [NSString stringWithFormat:@"%@ o' clock",wordHours];
    } if (60 - [minutes intValue] > 30 && [minutes intValue] != 15) {
        return [NSString stringWithFormat:@"%@ minutes past %@",wordMunutes, wordHours];
    } if ([minutes intValue] == 15) {
        return [NSString stringWithFormat:@"quarter past %@",wordHours];
    } if ([minutes intValue] == 30) {
       return [NSString stringWithFormat:@"half past %@",wordHours];
    } if ([minutes intValue] == 45) {
        wordHours = [numberFormatter stringFromNumber: [NSNumber numberWithInt:[hoursValue intValue] + 1]];
        return [NSString stringWithFormat:@"quarter to %@",wordHours];
    } else {
        wordHours = [numberFormatter stringFromNumber: [NSNumber numberWithInt:[hoursValue intValue] + 1]];
        minutesValue = [NSNumber numberWithInt:60 - [minutesValue intValue]];
        wordMunutes = [numberFormatter stringFromNumber: minutesValue];
        wordMunutes = [wordMunutes stringByReplacingOccurrencesOfString:@"-" withString:@" "];
        return [NSString stringWithFormat:@"%@ minutes to %@", wordMunutes, wordHours];
    }
}
@end
