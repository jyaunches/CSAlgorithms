#import "NSNumber+Helpers.h"


@implementation NSNumber (Helpers)
- (BOOL)isLessThan:(NSNumber *)value {
    return self.intValue < value.intValue;
}
@end