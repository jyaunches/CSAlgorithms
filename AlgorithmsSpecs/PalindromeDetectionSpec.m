//
//  LinkedListsSpec.m
//  Algorithms
//
//  Created by Julietta Yaunches on 9/16/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "LinkedNode.h"
#import "LinkedList.h"

SPEC_BEGIN(PalindromeDetectionSpec)

        __block LinkedList *linkedList;

        describe(@"palindrome detection", ^{
            it(@"should determine if not Palindrome", ^{
                LinkedNode *node4 = [[LinkedNode alloc] initWithData:4 withNext:nil];
                LinkedNode *node1 = [[LinkedNode alloc] initWithData:1 withNext:node4];
                LinkedNode *node3 = [[LinkedNode alloc] initWithData:3 withNext:node1];
                LinkedNode *node2 = [[LinkedNode alloc] initWithData:2 withNext:node3];
                LinkedNode *node5 = [[LinkedNode alloc] initWithData:5 withNext:node2];

                linkedList = [[LinkedList alloc] initWithRootNode:node5];
                BOOL isPalindrome = [linkedList isPalindrome];
                [[@(isPalindrome) should] beFalse];
            });

            it(@"should determine if Palindrome", ^{
                LinkedNode *node7 = [[LinkedNode alloc] initWithData:0 withNext:nil];
                LinkedNode *node6 = [[LinkedNode alloc] initWithData:1 withNext:node7];
                LinkedNode *node5 = [[LinkedNode alloc] initWithData:2 withNext:node6];
                LinkedNode *node4 = [[LinkedNode alloc] initWithData:3 withNext:node5];
                LinkedNode *node3 = [[LinkedNode alloc] initWithData:2 withNext:node4];
                LinkedNode *node2 = [[LinkedNode alloc] initWithData:1 withNext:node3];
                LinkedNode *node1 = [[LinkedNode alloc] initWithData:0 withNext:node2];

                linkedList = [[LinkedList alloc] initWithRootNode:node1];

                BOOL isPalindrome = [linkedList isPalindrome];
                [[@(isPalindrome) should] beTrue];
            });
        });



SPEC_END
