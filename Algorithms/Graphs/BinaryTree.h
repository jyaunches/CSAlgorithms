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
- (id)initWithRoot:(BinaryTreeNode *)root;
- (BOOL)isBST:(BinaryTreeNode *)node withMin:(NSInteger)min andMax:(NSInteger)max;
- (BOOL)isBST;
@end
