#import <Foundation/Foundation.h>

@interface NSMutableArray (QueueHelper)
- (void)pushObjects:(NSArray *)incomingObjects;

- (NSMutableArray *)subarrayFrom:(NSUInteger)startIndex to:(NSUInteger)endIndex;
@end