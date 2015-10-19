//
//  BinaryTreeNode.h
//  Algorithms
//
//  Created by Julietta Yaunches on 10/2/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BinaryTreeNode : NSObject
@property(nonatomic) int value;
@property(nonatomic, strong) BinaryTreeNode *left;
@property(nonatomic, strong) BinaryTreeNode *right;

- (id)initWithValue:(int)value;
- (BOOL)isLeaf;
- (BOOL)bstChildrenSatisfyMin:(NSInteger)min andMax:(NSInteger)max;
@end
