//
//  BinaryTreeAncestorFinder.m
//  Algorithms
//
//  Created by Julietta Yaunches on 10/5/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import "BinaryTreeAncestorFinder.h"
#import "BinaryTreeNode.h"

@interface BinaryTreeAncestorFinder ()
@property(nonatomic, strong) BinaryTreeNode *root;
@property(nonatomic, strong) BinaryTreeNode *commonAncestor;
@end

// Class purpose:
// Wrap a binary tree and, given two nodes within that tree, determine their closest common ancestor

@implementation BinaryTreeAncestorFinder

- (id)initWithRoot:(BinaryTreeNode *)root {
    self = [super init];
    self.root = root;
    return self;
}

// Example Binary Tree
//          6
//        /    \
//       12     32
//      /  \      \
//     9   30      41
//        /       /
//       13      10

// Common ancestor of 13 & 9 should be 12

// Algorithm:
// DFS
// For each node we traverse left, then right looking for one of our 2 target nodes
//  -> If one is found we return from the current traversal with a positive indicator that a descendant was found
//  -> If this was a left traversal, we look right.
//  -> Following left and right traversal, if a descendant was found on each side, the current node is common ancestor
//  -> We stop when we find the current ancestor

// Asymptotic Analysis:
// DFS -> O(E) + any setup

- (BinaryTreeNode *)commonAncestor:(BinaryTreeNode *)node1 and:(BinaryTreeNode *)node2 {
    [self subTree:self.root containsNode:node1 or:node2];
    return self.commonAncestor;
}

- (BOOL)subTree:(BinaryTreeNode *)currNode containsNode:(BinaryTreeNode *)target1 or:(BinaryTreeNode *)target2 {
    if(!currNode)
        return NO;

    if (currNode == target1 || currNode == target2)   {
        return YES;
    }

    BOOL foundLeft = [self subTree:currNode.left containsNode:target1 or:target2];
    BOOL foundRight = NO;
    if (!self.commonAncestor) {
        foundRight = [self subTree:currNode.right containsNode:target1 or:target2];
    }

    if(foundLeft && foundRight)
        self.commonAncestor = currNode;

    return foundLeft || foundRight;
}

@end
