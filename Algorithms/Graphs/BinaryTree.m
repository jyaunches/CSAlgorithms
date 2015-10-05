//
//  BinaryTree.m
//  Algorithms
//
//  Created by Julietta Yaunches on 10/2/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import "BinaryTree.h"
#import "BinaryTreeNode.h"

@interface BinaryTree ()
@property(nonatomic, strong) BinaryTreeNode *root;
@end


int NO_MAX = -1;
int NO_MIN = -1;

@implementation BinaryTree

- (id)initWithRoot:(BinaryTreeNode *)root {
    self = [super init];
    self.root = root;
    return self;
}

// Determine if a binary tree is a binary search tree

// Algorithm:
// Use a DFS. At each node, check that left <= node < right
//   Problem: Not only does each node need to satisfy left <= node < right all nodes down the left side
//   from the root need to be <= than the root and all other parent nodes. The same down the right side
//   Ex. This graph should return NO
//          20
//        /    \
//       12     32
//      / \       \
//    12   14     41
//        /  \    /
//       13  19  10 <- node that breaks it
//   Ex. This graph should return YES
//          20
//        /    \
//       12     32
//      / \       \
//    12   14     41
//        /  \    /
//       13  19  34
//   Solution:
//   for a given node down the left it needs to <= the min value of all it's parent nodes
//   for a given node down the right it needs to > the max value of all it's parent nodes
//   as we traverse the graph keep track of and pass down parent nodes min/max value
//
//   NOTE: we need to evaluate a nodes children with the min and max as a left child can be <= min
//   while a right child must be < min
//       12
//      / \           <- correct BST
//    12   14
//       12
//      / \           <- incorrect BST
//    10   12


- (BOOL)isBST {
    return [self isBST:self.root withMin:NSIntegerMin andMax:NSIntegerMax];
}

- (BOOL)isBST:(BinaryTreeNode *)node withMin:(NSInteger)min andMax:(NSInteger)max {
    if(!node || [node isLeaf])
        return YES;

    if(![node bstChildrenSatisfyMin:min andMax:max])
        return NO;

    BOOL leftIsBST = [self isBST:node.left withMin:min andMax:node.value ];
    BOOL rightIsBST = [self isBST:node.right withMin:node.value andMax:max];
    return leftIsBST && rightIsBST;
}
@end
