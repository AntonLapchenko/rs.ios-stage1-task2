#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.year = [year integerValue];
    components.month = [month integerValue];
    components.day = [day integerValue];
    
    if ([components isValidDateInCalendar:calendar]) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
        formatter.dateFormat = @"dd MMMM, EEEE";
        NSDate *date = [calendar dateFromComponents:components];
        return [formatter stringFromDate:date];
        
    } else {
        return @"Такого дня не существует";
    }
}

@end
