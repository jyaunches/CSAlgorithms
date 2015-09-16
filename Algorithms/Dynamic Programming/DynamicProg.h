#import <Foundation/Foundation.h>


@interface DynamicProg : NSObject
+ (NSArray *)find:(NSArray *)coins forSum:(NSNumber *)sum;

+ (NSNumber *)findLengthOfNonDecreasingSequence:(NSArray *)sequence;

+ (NSNumber *)shortestPathFrom:(NSNumber *)start to:(NSNumber *)finish inGraphWithEdges:(NSArray *)edges;

+ (NSNumber *)findZigZagLength:(NSMutableArray *)inputSequence;
@end