#import <ObjectiveSugar/ObjectiveSugar.h>
#import "NSMutableArray+QueueHelper.h"
#import "NSArray+Helpers.h"

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

- (NSMutableArray *)subarrayFrom:(NSUInteger)startIndex to:(NSUInteger)endIndex {
    if([self isEmpty]){
        return self;
    }

    if(endIndex > [self count]){
        endIndex = [self count];
    }
    return [[self subarrayWithRange:NSMakeRange(startIndex, endIndex - startIndex)] mutableCopy];
}

- (void)moveObjectToFront:(id)item {
    if([self containsObject:item]){
        [self removeObject:item];
        [self insertObject:item atIndex:0];
    }
}
@end