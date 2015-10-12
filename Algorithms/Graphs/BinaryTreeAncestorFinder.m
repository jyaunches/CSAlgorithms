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
@property(nonatomic) int identifiedDescendants;
@property(nonatomic, strong) BinaryTreeNode *root;
@property(nonatomic, strong) BinaryTreeNode *commonAncestor;
@end

@implementation BinaryTreeAncestorFinder

- (id)initWithRoot:(BinaryTreeNode *)root {
    self = [super init];
    self.root = root;
    self.identifiedDescendants = 0;
    return self;
}

- (BinaryTreeNode *)commonAncestor:(BinaryTreeNode *)node1 and:(BinaryTreeNode *)node2 {
    [self subTree:self.root containsNode:node1 or:node2];
    return self.commonAncestor;
}

- (BOOL)subTree:(BinaryTreeNode *)currNode containsNode:(BinaryTreeNode *)target1 or:(BinaryTreeNode *)target2 {
    if(!currNode)
        return NO;

    if (currNode == target1 || currNode == target2)   {
        [self markFoundDescendant:currNode];
        return YES;
    }

    BOOL foundLeft = [self subTree:currNode.left containsNode:target1 or:target2];
    BOOL foundRight = NO;
    if (!self.commonAncestor && ![self allDescendantsFound]) {
        foundRight = [self subTree:currNode.right containsNode:target1 or:target2];
    }

    if(foundLeft && foundRight)
        self.commonAncestor = currNode;

    return foundLeft || foundRight;
}

- (BOOL)allDescendantsFound {
    return self.identifiedDescendants >= 2;
}

- (void)markFoundDescendant:(BinaryTreeNode *)node {
    self.identifiedDescendants++;
}
@end
