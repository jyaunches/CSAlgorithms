//
//  BinarySearchTreeSpec.m
//  Algorithms
//
//  Created by Julietta Yaunches on 10/2/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//


#import <Kiwi/Kiwi.h>
#import "BinaryTreeNode.h"
#import "BinaryTree.h"

// The connected components problem is to determine how many connected components make up a graph,
// and to make it possible to find, for each node in the graph, which component it belongs to.
// source: http://www.cs.cornell.edu/courses/cs2112/2012sp/lectures/lec24/lec24-12sp.html
SPEC_BEGIN(BinarySearchTreeSpec)
// binary search tree
//        20
//      /    \
//     12     32
//    / \       \
//  12   14     41
//      /  \    /
//     15  19  34

        describe(@"Binary search tree determination", ^{

            it(@"should determine if binary tree is binary search tree", ^{
                BinaryTreeNode *bstRoot = [[BinaryTreeNode alloc] initWithValue:20];
                BinaryTreeNode *node12 = [[BinaryTreeNode alloc] initWithValue:12];
                BinaryTreeNode *node14 = [[BinaryTreeNode alloc] initWithValue:14];
                BinaryTreeNode *node15 = [[BinaryTreeNode alloc] initWithValue:15];
                BinaryTreeNode *node19 = [[BinaryTreeNode alloc] initWithValue:19];
                BinaryTreeNode *node34 = [[BinaryTreeNode alloc] initWithValue:34];
                BinaryTreeNode *node32 = [[BinaryTreeNode alloc] initWithValue:32];
                BinaryTreeNode *node41 = [[BinaryTreeNode alloc] initWithValue:41];

                bstRoot.left = node12;
                bstRoot.right = node32;

                node12.left = node12;
                node12.right = node14;

                node14.left = node15;
                node14.right = node19;

                node32.right = node41;

                node41.left = node34;

                BinaryTree *tree = [[BinaryTree alloc] initWithRoot:bstRoot];
                [[@([tree isBST]) should] beTrue];
            });

            // binary tree
            //         2
            //      /     \
            //     7       5
            //    / \       \
            //   2   6       9
            //      /  \    /
            //     5   11  4

            __block BinaryTreeNode *btRoot;

            beforeAll(^{
                btRoot = [[BinaryTreeNode alloc] initWithValue:2];
                BinaryTreeNode *node5 = [[BinaryTreeNode alloc] initWithValue:5];
                BinaryTreeNode *node7 = [[BinaryTreeNode alloc] initWithValue:7];
                BinaryTreeNode *node2 = [[BinaryTreeNode alloc] initWithValue:2];
                BinaryTreeNode *node6 = [[BinaryTreeNode alloc] initWithValue:6];
                BinaryTreeNode *node11 = [[BinaryTreeNode alloc] initWithValue:11];
                BinaryTreeNode *node9 = [[BinaryTreeNode alloc] initWithValue:9];
                BinaryTreeNode *node4 = [[BinaryTreeNode alloc] initWithValue:4];

                btRoot.left = node7;
                btRoot.right = node5;

                node7.left = node2;
                node7.right = node6;

                node6.left = node5;
                node6.right = node11;

                node5.right = node9;
                node9.left = node4;
            });

            // Problem: As you move down the graph a given node not only needs to have left <= node < right
            // all nodes down the left side from the root need to be less than the root.
            // This graph should return NO
            //        20
            //      /    \
            //     12     32
            //    / \     /
            //  12   26  16



        });
SPEC_END