#import <Foundation/Foundation.h>


@interface DynamicProg : NSObject
+ (NSArray *)find:(NSArray *)coins forSum:(NSNumber *)sum;

+ (NSNumber *)findLengthOfNonDecreasingSequence:(NSArray *)sequence;

+ (NSNumber *)findZigZagLength:(NSMutableArray *)inputSequence;
@end