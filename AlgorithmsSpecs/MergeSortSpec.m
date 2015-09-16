//
//  MergeSortSpec.m
//  Algorithms
//
//  Created by Julietta Yaunches on 9/15/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "MergeSort.h"

SPEC_BEGIN(MergeSortSpec)
    describe(@"MergeSort", ^{
        NSMutableArray *unsorted = [@[@(34), @(55), @(7), @(30), @(9), @(10), @(40), @(1), @(5)] mutableCopy];
        NSMutableArray *expectedResult = [@[@(1), @(5), @(7), @(9), @(10), @(30), @(34), @(40), @(55)] mutableCopy];

        NSArray *sorted = [MergeSort sort:unsorted];

        [[sorted should] equal:expectedResult];
    });
SPEC_END