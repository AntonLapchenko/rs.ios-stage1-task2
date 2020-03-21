#import "NSString+Transform.h"

@implementation NSString (Transform)

-(NSString*)transform {
    NSArray *arr = [self componentsSeparatedByString:@" "];
    //NSString *test = [NSString new];
    for (NSUInteger i = 0; i < [arr count]; i++) {
        for (NSUInteger j = 0; j < [[arr objectAtIndex:i] length]; j++) {
            if ([self pangram] ) {
            
            } else {
                
            }
        }
        
        
    }
    
    
   
        
        return self;
    }


    - (BOOL)pangram {
        NSMutableSet *set = [[NSMutableSet alloc] init];
        for (int i = 0; i < self.length; i++) {
            if ([[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember:[self characterAtIndex:i]]) {
                [set addObject:[NSString stringWithFormat:@"%c", [self characterAtIndex:i]]];
            } else if ([[NSCharacterSet lowercaseLetterCharacterSet] characterIsMember:[self characterAtIndex:i]]) {
                [set addObject:[NSString stringWithFormat:@"%c", [self characterAtIndex:i]]];
            }
        }
        if (set.count >= 26) {
            return YES;
        } else {
            return NO;
        }
    }
    @end
