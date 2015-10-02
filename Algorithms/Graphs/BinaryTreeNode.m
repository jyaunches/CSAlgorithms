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

- (BOOL)bstChildrenSatisfyMin:(int)min andMax:(int)max {
    BOOL leftIsSatisfied = (self.left.value <= self.value) && (self.left.value > min);
    BOOL rightIsSatisfied = (self.right.value > self.value) && (self.right.value < max);
    return leftIsSatisfied && rightIsSatisfied;
}
@end
