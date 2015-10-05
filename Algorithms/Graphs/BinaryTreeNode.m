//
//  BinaryTreeNode.m
//  Algorithms
//
//  Created by Julietta Yaunches on 10/2/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import "BinaryTreeNode.h"

@implementation BinaryTreeNode
- (id)initWithValue:(int)value {
    self = [super init];
    self.value = value;
    return self;
}

- (BOOL)isLeaf {
    return (self.left == nil) && (self.right == nil);
}

- (BOOL)bstChildrenSatisfyMin:(NSInteger)min andMax:(NSInteger)max {
    BOOL leftIsSatisfied = [self noLeft] || ([self leftIsLessThan] && [self leftSatisfiesMin:min]);
    BOOL rightIsSatisfied = [self noRight] || ([self rightIsGreaterThan] && [self rightSatisfiesMax:max]);
    return leftIsSatisfied && rightIsSatisfied;
}

- (BOOL)leftSatisfiesMin:(NSInteger)min {
    BOOL noMin = min == NSIntegerMin;
    return (noMin || (self.left.value > min));
}

- (BOOL)leftIsLessThan {
    return (self.left.value <= self.value);
}

- (BOOL)noLeft {
    return self.left == nil;
}

- (BOOL)rightSatisfiesMax:(NSInteger)max {
    BOOL noMax = max == NSIntegerMax;
    return (noMax || (self.right.value < max));
}

- (BOOL)rightIsGreaterThan {
    return (self.right.value > self.value);
}

- (BOOL)noRight {
    return self.right == nil;
}
@end
