//
//  BinaryTreeCommonAncestorSpec.m
//  Algorithms
//
//  Created by Julietta Yaunches on 10/5/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "BinaryTreeNode.h"
#import "BinaryTree.h"
#import "BinaryTreeAncestorFinder.h"

SPEC_BEGIN(BinaryTreeAncestorFinderSpec)
        describe(@"BinaryTreeAncestorFinder", ^{
            // binary tree
            //          6
            //        /    \
            //       12     32
            //      /  \      \
            //     9   30      41
            //        /       /
            //       13      10

            __block BinaryTreeAncestorFinder *tree;
            __block BinaryTreeNode *node9;
            __block BinaryTreeNode *node13;
            __block BinaryTreeNode *node12;
            beforeEach(^{
                BinaryTreeNode *btRoot = [[BinaryTreeNode alloc] initWithValue:6];
                node12 = [[BinaryTreeNode alloc] initWithValue:12];
                node9 = [[BinaryTreeNode alloc] initWithValue:9];
                BinaryTreeNode *node30 = [[BinaryTreeNode alloc] initWithValue:30];
                node13 = [[BinaryTreeNode alloc] initWithValue:13];
                BinaryTreeNode *node32 = [[BinaryTreeNode alloc] initWithValue:32];
                BinaryTreeNode *node41 = [[BinaryTreeNode alloc] initWithValue:41];
                BinaryTreeNode *node10 = [[BinaryTreeNode alloc] initWithValue:10];

                btRoot.left = node12;
                btRoot.right = node32;
                node12.left = node9;
                node12.right = node30;
                node30.left = node13;
                node32.right = node41;
                node41.left = node10;

                tree = [[BinaryTreeAncestorFinder alloc] initWithRoot:btRoot];
            });

            it(@"should find common ancestor of 9 and 13 as 12", ^{
                BinaryTreeNode *ancestor = [tree commonAncestor:node9 and:node13];

                [[ancestor should] equal:node12];
            });

            it(@"should return nil if one of targets is not in tree", ^{
                BinaryTreeNode *node14 = [[BinaryTreeNode alloc] initWithValue:14];

                BinaryTreeNode *ancestor = [tree commonAncestor:node9 and:node14];

                [[ancestor should] beNil];
            });

            it(@"should return nil if neither of targets is in tree", ^{
                BinaryTreeNode *node14 = [[BinaryTreeNode alloc] initWithValue:14];
                BinaryTreeNode *node6 = [[BinaryTreeNode alloc] initWithValue:14];

                BinaryTreeNode *ancestor = [tree commonAncestor:node6 and:node14];

                [[ancestor should] beNil];
            });

        });
SPEC_END