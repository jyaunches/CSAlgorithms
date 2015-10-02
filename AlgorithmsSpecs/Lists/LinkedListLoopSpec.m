//
//  LinkedListLoopSpec.m
//  Algorithms
//
//  Created by Julietta Yaunches on 9/28/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "LinkedNode.h"
#import "LinkedList.h"

SPEC_BEGIN(LinkedListLoopSpec)

        describe(@"detecting a loop", ^{
            xit(@"should detect a loop", ^{
                LinkedNode *node4;
                LinkedNode *node9 = [[LinkedNode alloc] initWithData:8 withNext:node4];
                LinkedNode *node8 = [[LinkedNode alloc] initWithData:7 withNext:node9];
                LinkedNode *node7 = [[LinkedNode alloc] initWithData:6 withNext:node8];
                LinkedNode *node6 = [[LinkedNode alloc] initWithData:5 withNext:node7];
                LinkedNode *node5 = [[LinkedNode alloc] initWithData:4 withNext:node6];
                node4 = [[LinkedNode alloc] initWithData:3 withNext:node5];
                LinkedNode *node3 = [[LinkedNode alloc] initWithData:2 withNext:node4];
                LinkedNode *node2 = [[LinkedNode alloc] initWithData:1 withNext:node3];
                LinkedNode *node1 = [[LinkedNode alloc] initWithData:0 withNext:node2];

                LinkedList *linkedList = [[LinkedList alloc] initWithRootNode:node1];

                BOOL hasLoop = [linkedList hasLoop];
                [[@(hasLoop) should] beTrue];
            });
        });

SPEC_END
