//
//  LinkedListsSpec.m
//  Algorithms
//
//  Created by Julietta Yaunches on 9/16/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "GraphEdge.h"
#import "GraphSort.h"
#import "LinkedNode.h"
#import "LinkedList.h"

SPEC_BEGIN(LinkedListSpec)
    describe(@"Singly Linked Lists", ^{
        __block LinkedList *linkedList;
        __block LinkedNode *node4;

        beforeEach(^{
            node4 = [[LinkedNode alloc] initWithData:4 withNext:nil];
            LinkedNode *node1 = [[LinkedNode alloc] initWithData:1 withNext:node4];
            LinkedNode *node3 = [[LinkedNode alloc] initWithData:3 withNext:node1];
            LinkedNode *node2 = [[LinkedNode alloc] initWithData:2 withNext:node3];
            LinkedNode *node5 = [[LinkedNode alloc] initWithData:5 withNext:node2];

            linkedList = [[LinkedList alloc] initWithRootNode:node5];
        });

        it(@"should find last node in list", ^{
            LinkedNode *lastNode = [linkedList lastNode];
            [[lastNode should] equal:node4];
        });

        it(@"should insert node at end", ^{
            LinkedNode *newNode = [[LinkedNode alloc] initWithData:9 withNext:nil];
            [[@([linkedList size]) should] equal:@(5)];

            [linkedList appendOnEnd:newNode];

            [[@([linkedList size]) should] equal:@(6)];

            LinkedNode *lastNode = [linkedList lastNode];
            [[lastNode should] equal:newNode];
        });
        
        it(@"should make new node root if no root exists", ^{
            LinkedList *listWithoutRoot = [[LinkedList alloc] initWithRootNode:nil];

            [[@([listWithoutRoot size]) should] equal:@(0)];

            LinkedNode *newNode = [[LinkedNode alloc] initWithData:7 withNext:nil];
            [listWithoutRoot appendOnEnd:newNode];

            [[@([listWithoutRoot size]) should] equal:@(1)];
        });

        it(@"should delete node", ^{
            [[@([linkedList size]) should] equal:@(5)];

            [linkedList deleteNodeWithValue:2];

            [[@([linkedList size]) should] equal:@(4)];
        });

        it(@"should remove duplicates from an unsorted linked list", ^{
            LinkedNode *dup3Node = [[LinkedNode alloc] initWithData:3 withNext:nil];
            [linkedList appendOnEnd:dup3Node];
            [[@([linkedList size]) should] equal:@(6)];

            [linkedList removeDuplicates];

            [[@([linkedList size]) should] equal:@(5)];
        });

        it(@"should find the kth from the end node", ^{
            LinkedNode *result = [linkedList findKthFromEnd:2];
            [[@(result.data) should] equal:@(1)];
        });

//        it(@"should partition list around given value", ^{
//            [linkedList partition:@(3)];
//
//            LinkedNode *node = [linkedList find:@(3)];
//            [[@(node.next.data) should] beGreaterThan:@(3)];
//            [[@(node.next.next.data) should] beGreaterThan:@(3)];
//        });

        describe(@"palindrome", ^{
            it(@"should determine if not Palindrome", ^{
                BOOL isPalindrome = [linkedList isPalindrome];
                [[@(isPalindrome) should] beFalse];
            });
            it(@"should determine if Palindrome", ^{
                LinkedNode *node7 = [[LinkedNode alloc] initWithData:0 withNext:nil];
                LinkedNode *node6 = [[LinkedNode alloc] initWithData:1 withNext:node7];
                LinkedNode *node5 = [[LinkedNode alloc] initWithData:2 withNext:node6];
                node4 = [[LinkedNode alloc] initWithData:3 withNext:node5];
                LinkedNode *node3 = [[LinkedNode alloc] initWithData:2 withNext:node4];
                LinkedNode *node2 = [[LinkedNode alloc] initWithData:1 withNext:node3];
                LinkedNode *node1 = [[LinkedNode alloc] initWithData:0 withNext:node2];

                linkedList = [[LinkedList alloc] initWithRootNode:node1];

                BOOL isPalindrome = [linkedList isPalindrome];
                [[@(isPalindrome) should] beTrue];
            });
        });


    });

SPEC_END
