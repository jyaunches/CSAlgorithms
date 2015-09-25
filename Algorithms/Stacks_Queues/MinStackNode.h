#import <Foundation/Foundation.h>
#import "StackNode.h"


@interface MinStackNode : StackNode
@property(nonatomic, strong) MinStackNode *lastMin;
- (id)initWithValue:(NSNumber *)number andLastMin:(MinStackNode *)min;
@end