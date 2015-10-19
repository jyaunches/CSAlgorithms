//
//  BinaryTreePathValueFinder.m
//  Algorithms
//
//  Created by Julietta Yaunches on 10/6/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <ObjectiveSugar/ObjectiveSugar.h>
#import "BinaryTreePathValueFinder.h"
#import "BinaryTreeNode.h"
#import "NSMutableArray+BinaryTreeNode.h"

@interface BinaryTreePathValueFinder ()
@property(nonatomic, strong) BinaryTreeNode *root;
@property(nonatomic, strong) NSMutableArray *evalQueue;
@property(nonatomic, strong) NSMutableArray *results;
@property(nonatomic) int target;
@end

@implementation BinaryTreePathValueFinder

- (id)initWithRoot:(BinaryTreeNode *)node {
    self = [super init];
    self.root = node;
    return self;
}

// Purpose:
// Given a target within a binary tree, find all paths that sum to the target
// Example:
//          1
//        /    \
//       3     10
//      /  \      \
//     2   1      5
//        /       /
//       13      0
// For a target of 5, in this tree there would be 4 paths:
//      3-2, 1-3-1, 5, & 5-0

// Algorithm:
//   DFS - altered to maintain an evaluation queue as traversal occurs
//    * eval queue holds the top most parent and is added to as each child is visited
//    * a current evaluation range within the queue is maintained and is updated as the tree is traversed
//    * when a child is visited, they are pushed onto the eval queue and are visited
//           -> the current range of the eval queue is considered
//                  IF all nodes in the range sum to less than the target current range is updated to include the child
//                      and the traveral continues
//                  IF all nodes in the range sum to the target, a result is stored and the traversal continues
//                      (the range stays the same and can be thought to have lost the topmost node and gained the current node)
//                  IF all nodes in the range sum to greater than the target, the range is reduced by one (excluding the topmost)
//                      and the range is considered again (and reduced again until it meets one of the above criteria
//
//  NOTES:
//   The recursive nature of the DFS is used to maintain the evaluation queue and range.
//     * When both left and right subtrees return from their calls to evalNode, the evalQueue
//       pops the current node from the queue. This ensures no already visited nodes remain in the evalQueue

// Asymptotic Analysis:
// DFS -> O(E) + any setup/interim storage/summing etc..

- (NSArray *)evaluateForTarget:(int)target {
    if (!self.root)
        return self.evalQueue;

    self.target = target;
    self.evalQueue = [@[self.root] mutableCopy];
    self.results = [@[] mutableCopy];

    [self evalNode:self.root withRange:NSMakeRange(0, 0)];

    return self.results;
}

- (void)evalNode:(BinaryTreeNode *)node withRange:(NSRange)range {
    if (!node)
        return;

    range.length = range.length + 1;
    [self.evalQueue insertObject:node atIndex:0];

    while ([self.evalQueue sumNodesInRange:range] > self.target) {
        range.length = range.length - 1;
    }

    if ([self.evalQueue sumNodesInRange:range] == self.target) {
        [self.results push:@"result found"];
    }

    [self evalNode:node.left withRange:range];
    [self evalNode:node.right withRange:range];

    [self.evalQueue shift];
}

@end
