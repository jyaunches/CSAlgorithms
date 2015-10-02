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
//      / \     /
//    12   26  16
//   Solution:
//   for a given node down the left it needs to <= the min value of all it's parent nodes
//   for a given node down the right it needs to > the max value of all it's parent nodes
//   as we traverse the graph keep track of and pass down parent nodes min/max value


- (BOOL)isBST {
    return [self isBST:self.root withMin:0 andMax:self.root.value];
}

- (BOOL)isBST:(BinaryTreeNode *)node withMin:(int)min andMax:(int)max {
    if([node isLeaf])
        return YES;

    if(![node bstChildrenSatisfyMin:min andMax:max])
        return NO;

    BOOL leftIsBST = [self isBST:node.left withMin:min andMax:node.value ];
    BOOL rightIsBST = [self isBST:node.right withMin:node.value andMax:max];
    return leftIsBST && rightIsBST;
}
@end
