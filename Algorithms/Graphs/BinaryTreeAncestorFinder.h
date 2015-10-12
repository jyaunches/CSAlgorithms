//
//  BinaryTreeAncestorFinder.h
//  Algorithms
//
//  Created by Julietta Yaunches on 10/5/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BinaryTreeNode;

@interface BinaryTreeAncestorFinder : NSObject
- (id)initWithRoot:(BinaryTreeNode *)root;

- (BinaryTreeNode *)commonAncestor:(BinaryTreeNode *)node1 and:(BinaryTreeNode *)node2;
@end
