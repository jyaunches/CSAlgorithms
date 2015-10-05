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

SPEC_BEGIN(BinarySearchTreeSpec)
        describe(@"Binary search tree determination", ^{

            describe(@"correct bst", ^{
                // correct binary search tree
                //          20
                //        /    \
                //       12     32
                //      / \       \
                //    12   14     41
                //        /  \    /
                //       13  19  34
                it(@"should recognize correct binary search tree", ^{
                    BinaryTreeNode *bstRoot = [[BinaryTreeNode alloc] initWithValue:20];
                    BinaryTreeNode *node12 = [[BinaryTreeNode alloc] initWithValue:12];
                    BinaryTreeNode *node12_2 = [[BinaryTreeNode alloc] initWithValue:12];
                    BinaryTreeNode *node14 = [[BinaryTreeNode alloc] initWithValue:14];
                    BinaryTreeNode *node13 = [[BinaryTreeNode alloc] initWithValue:13];
                    BinaryTreeNode *node19 = [[BinaryTreeNode alloc] initWithValue:19];
                    BinaryTreeNode *node34 = [[BinaryTreeNode alloc] initWithValue:34];
                    BinaryTreeNode *node32 = [[BinaryTreeNode alloc] initWithValue:32];
                    BinaryTreeNode *node41 = [[BinaryTreeNode alloc] initWithValue:41];

                    bstRoot.left = node12;
                    bstRoot.right = node32;

                    node12.left = node12_2;
                    node12.right = node14;

                    node14.left = node13;
                    node14.right = node19;

                    node32.right = node41;

                    node41.left = node34;

                    BinaryTree *tree = [[BinaryTree alloc] initWithRoot:bstRoot];
                    BOOL isBST = [tree isBST];
                    [[@(isBST) should] beTrue];
                });
            });

            describe(@"incorrect bst", ^{
                // binary tree (incorrect bst) - right subtree contains left node less than root
                //          20
                //        /    \
                //       12     32
                //      / \       \
                //    12   14     41
                //        /  \    /
                //       13  19  10 <- incorrect node
                it(@"should recognize incorrect binary search tree - right subtree left node", ^{
                    BinaryTreeNode *btRoot = [[BinaryTreeNode alloc] initWithValue:20];
                    BinaryTreeNode *node12 = [[BinaryTreeNode alloc] initWithValue:12];
                    BinaryTreeNode *node12_2 = [[BinaryTreeNode alloc] initWithValue:12];
                    BinaryTreeNode *node14 = [[BinaryTreeNode alloc] initWithValue:14];
                    BinaryTreeNode *node13 = [[BinaryTreeNode alloc] initWithValue:13];
                    BinaryTreeNode *node19 = [[BinaryTreeNode alloc] initWithValue:19];
                    BinaryTreeNode *node10 = [[BinaryTreeNode alloc] initWithValue:10];
                    BinaryTreeNode *node32 = [[BinaryTreeNode alloc] initWithValue:32];
                    BinaryTreeNode *node41 = [[BinaryTreeNode alloc] initWithValue:41];

                    btRoot.left = node12;
                    btRoot.right = node32;

                    node12.left = node12_2;
                    node12.right = node14;

                    node14.left = node13;
                    node14.right = node19;

                    node32.right = node41;

                    node41.left = node10;

                    BinaryTree *tree = [[BinaryTree alloc] initWithRoot:btRoot];
                    BOOL isBST = [tree isBST];
                    [[@(isBST) should] beFalse];
                });

                // binary tree (incorrect bst) - right subtree contains right node equal to parent node
                //          20
                //        /    \
                //       12     32
                //      / \       \
                //    12   14     41
                //        /  \      \
                //       13  19      41 <- incorrect node
                it(@"should recognize incorrect binary search tree - right node equal to parent node", ^{
                    BinaryTreeNode *btRoot = [[BinaryTreeNode alloc] initWithValue:20];
                    BinaryTreeNode *node12 = [[BinaryTreeNode alloc] initWithValue:12];
                    BinaryTreeNode *node12_2 = [[BinaryTreeNode alloc] initWithValue:12];
                    BinaryTreeNode *node14 = [[BinaryTreeNode alloc] initWithValue:14];
                    BinaryTreeNode *node13 = [[BinaryTreeNode alloc] initWithValue:13];
                    BinaryTreeNode *node19 = [[BinaryTreeNode alloc] initWithValue:19];
                    BinaryTreeNode *node41_2 = [[BinaryTreeNode alloc] initWithValue:41];
                    BinaryTreeNode *node32 = [[BinaryTreeNode alloc] initWithValue:32];
                    BinaryTreeNode *node41 = [[BinaryTreeNode alloc] initWithValue:41];

                    btRoot.left = node12;
                    btRoot.right = node32;

                    node12.left = node12_2;
                    node12.right = node14;

                    node14.left = node13;
                    node14.right = node19;

                    node32.right = node41;

                    node41.right = node41_2;

                    BinaryTree *tree = [[BinaryTree alloc] initWithRoot:btRoot];
                    BOOL isBST = [tree isBST];
                    [[@(isBST) should] beFalse];
                });


                // binary tree (incorrect bst) - left subtree contains right node greater than root
                //          20
                //        /    \
                //       12     32
                //      / \       \
                //    12   22     41
                //        /  \    /
                //       13  19  10
                // incorrect node is node 22
                it(@"should recognize incorrect binary search tree", ^{
                    BinaryTreeNode *btRoot = [[BinaryTreeNode alloc] initWithValue:20];
                    BinaryTreeNode *node12 = [[BinaryTreeNode alloc] initWithValue:12];
                    BinaryTreeNode *node12_2 = [[BinaryTreeNode alloc] initWithValue:12];
                    BinaryTreeNode *node22 = [[BinaryTreeNode alloc] initWithValue:2];
                    BinaryTreeNode *node13 = [[BinaryTreeNode alloc] initWithValue:13];
                    BinaryTreeNode *node19 = [[BinaryTreeNode alloc] initWithValue:19];
                    BinaryTreeNode *node10 = [[BinaryTreeNode alloc] initWithValue:10];
                    BinaryTreeNode *node32 = [[BinaryTreeNode alloc] initWithValue:32];
                    BinaryTreeNode *node41 = [[BinaryTreeNode alloc] initWithValue:41];

                    btRoot.left = node12;
                    btRoot.right = node32;

                    node12.left = node12_2;
                    node12.right = node22;

                    node22.left = node13;
                    node22.right = node19;

                    node32.right = node41;

                    node41.left = node10;

                    BinaryTree *tree = [[BinaryTree alloc] initWithRoot:btRoot];
                    BOOL isBST = [tree isBST];
                    [[@(isBST) should] beFalse];
                });
            });

            describe(@"BST creation", ^{
                it(@"should create a binary search tree from a sorted, incrementing array", ^{
                    BinaryTreeNode *node2 = [[BinaryTreeNode alloc] initWithValue:2];
                    BinaryTreeNode *node4 = [[BinaryTreeNode alloc] initWithValue:4];
                    BinaryTreeNode *node7 = [[BinaryTreeNode alloc] initWithValue:7];
                    BinaryTreeNode *node10 = [[BinaryTreeNode alloc] initWithValue:10];
                    BinaryTreeNode *node14 = [[BinaryTreeNode alloc] initWithValue:14];
                    BinaryTreeNode *node15 = [[BinaryTreeNode alloc] initWithValue:15];
                    BinaryTreeNode *node21 = [[BinaryTreeNode alloc] initWithValue:21];
                    BinaryTreeNode *node28 = [[BinaryTreeNode alloc] initWithValue:28];

                    NSArray *input = @[node2, node4, node7, node10, node14, node15, node21, node28];

                    // expected BST
                    //          14
                    //        /    \
                    //       7      21
                    //      / \    /  \
                    //     4  10 15  28
                    //    /
                    //   2

                    BinaryTree *tree = [[BinaryTree alloc] initWithSortedIncrementingArray:input];

                    [[tree.root.left should] equal:node7];
                    [[tree.root.right should] equal:node21];
                });

            });

        });
SPEC_END