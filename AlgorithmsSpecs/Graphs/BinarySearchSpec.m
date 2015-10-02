//
//  BinarySearchSpec.m
//  Algorithms
//
//  Created by Julietta Yaunches on 9/15/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "BinarySearch.h"

SPEC_BEGIN(BinarySearchSpec)
    describe(@"BinarySearch", ^{

        describe(@"Basic", ^{
            __block NSArray *sortedArray;
            beforeAll(^{
                sortedArray = @[@(3), @(7), @(12), @(21), @(22), @(23), @(40), @(90), @(112)];
            });
            it(@"should do basic binary search", ^{
                int indexOfResult = [BinarySearch basicSearch:sortedArray forItem:@(90)];
                [[@(indexOfResult) should] equal:@(7)];
            });

            it(@"should return -1 if target not in array", ^{
                int indexOfResult = [BinarySearch basicSearch:sortedArray forItem:@(4)];
                [[@(indexOfResult) should] equal:@(-1)];
            });
        });

        //Problem: a sorted array has been rotated so that the elements might appear in the order 3 4 5 6 7 1 2.
        //How would you find the minimum element?
        describe(@"Min element in shifted array", ^{
            __block NSArray *shiftedArray;
            beforeAll(^{
                shiftedArray = @[@(3), @(4), @(5), @(6), @(7), @(1), @(2)];
            });

            it(@"should return 1", ^{
                NSNumber *result =  [BinarySearch minElementIn:shiftedArray];
                [[result should] equal:@(1)];
            });
        });

    });
SPEC_END