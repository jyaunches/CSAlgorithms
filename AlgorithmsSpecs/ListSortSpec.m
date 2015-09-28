//
//  MergeSortSpec.m
//  Algorithms
//
//  Created by Julietta Yaunches on 9/15/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "MergeSort.h"
#import "BubbleSort.h"
#import "NSMutableArray+InsertionSort.h"

SPEC_BEGIN(ListSortSpec)

        __block NSMutableArray *expectedResult;
        __block NSMutableArray *unsorted;
        beforeEach(^{
            unsorted = [@[@(34), @(55), @(7), @(30), @(9), @(10), @(40), @(1), @(5)] mutableCopy];
            expectedResult = [@[@(1), @(5), @(7), @(9), @(10), @(30), @(34), @(40), @(55)] mutableCopy];
        });
        describe(@"MergeSort", ^{
            it(@"should perform merge sort", ^{
                NSArray *sorted = [MergeSort sort:unsorted];
                [[sorted should] equal:expectedResult];
            });
        });

        describe(@"BubbleSort", ^{
            it(@"should perform bubble sort", ^{
                NSArray *sorted = [BubbleSort sort:unsorted];
                [[sorted should] equal:expectedResult];
            });
        });

        describe(@"InsertionSort", ^{
            it(@"should perform insertion sort", ^{
                NSArray *sorted = [unsorted insertionSort];
                [[sorted should] equal:expectedResult];
            });
        });
SPEC_END