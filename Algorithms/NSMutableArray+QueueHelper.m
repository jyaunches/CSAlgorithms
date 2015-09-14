#import "NSMutableArray+QueueHelper.h"
#import "NSNumber+ObjectiveSugar.h"
#import "NSMutableArray+ObjectiveSugar.h"


@implementation NSMutableArray (QueueHelper)
- (void)pushObjects:(NSArray *)incomingObjects {
    if(incomingObjects && (incomingObjects.count > 0)){
        NSMutableArray *toInsert = [incomingObjects mutableCopy];
        
        while(toInsert.count > 0){
            id popped = [toInsert pop];
            [self insertObject:popped atIndex:0];
        }
    }
}
@end