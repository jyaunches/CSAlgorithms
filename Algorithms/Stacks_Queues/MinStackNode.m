#import "MinStackNode.h"


@implementation MinStackNode
- (id)initWithValue:(NSNumber *)number andLastMin:(MinStackNode *)min{
    self = [super initWithValue:number];
    self.lastMin = min;
    return self;
}
@end