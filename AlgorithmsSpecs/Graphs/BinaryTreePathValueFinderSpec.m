//
//  BinaryTreePathValueFinder.m
//  Algorithms
//
//  Created by Julietta Yaunches on 10/6/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//


#import <Kiwi/Kiwi.h>
#import "BinaryTreeNode.h"
#import "BinaryTreePathValueFinder.h"

SPEC_BEGIN(BinaryTreePathValueFinderSpec)
        describe(@"BinaryTreePathValueFinder", ^{

            // binary tree
            //          1
            //        /    \
            //       3     10
            //      /  \      \
            //     2   1      5
            //        /       /
            //       13      0
            it(@"should find all paths that sum to 5", ^{
                BinaryTreeNode *node1 = [[BinaryTreeNode alloc] initWithValue:1];
                BinaryTreeNode *node3 = [[BinaryTreeNode alloc] initWithValue:3];
                BinaryTreeNode *node2 = [[BinaryTreeNode alloc] initWithValue:2];
                BinaryTreeNode *node1_2 = [[BinaryTreeNode alloc] initWithValue:1];
                BinaryTreeNode *node13 = [[BinaryTreeNode alloc] initWithValue:13];
                BinaryTreeNode *node10 = [[BinaryTreeNode alloc] initWithValue:10];
                BinaryTreeNode *node5 = [[BinaryTreeNode alloc] initWithValue:5];
                BinaryTreeNode *node0 = [[BinaryTreeNode alloc] initWithValue:0];

                node1.left = node3;
                node1.right = node10;
                node3.left = node2;
                node3.right = node1_2;
                node1_2.left = node13;
                node10.right = node5;
                node5.left = node0;

                BinaryTreePathValueFinder *finder = [[BinaryTreePathValueFinder alloc] initWithRoot:node1];
                NSArray *foundPaths = [finder evaluateForTarget:5];

                [[@(foundPaths.count) should] equal:@(4)];
            });
        });
SPEC_END
