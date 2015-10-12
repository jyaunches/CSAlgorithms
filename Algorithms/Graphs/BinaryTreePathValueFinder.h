//
//  BinaryTreePathValueFinder.h
//  Algorithms
//
//  Created by Julietta Yaunches on 10/6/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BinaryTreeNode;

@interface BinaryTreePathValueFinder : NSObject

- (id)initWithRoot:(BinaryTreeNode *)node;

- (NSArray *)evaluateForTarget:(int)target;
@end
