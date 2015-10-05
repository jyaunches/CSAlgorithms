//
//  BinaryTree.h
//  Algorithms
//
//  Created by Julietta Yaunches on 10/2/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BinaryTreeNode;

@interface BinaryTree : NSObject
@property(nonatomic, strong) BinaryTreeNode *root;

- (id)initWithRoot:(BinaryTreeNode *)root;
- (id)initWithSortedIncrementingArray:(NSArray *)array;
- (BOOL)isBST;

@end
