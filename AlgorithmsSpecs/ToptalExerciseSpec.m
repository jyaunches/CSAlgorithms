//
//  ToptalExerciseSpec.m
//  Algorithms
//
//  Created by Julietta Yaunches on 10/23/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//
#import <Kiwi/Kiwi.h>
#import "MidIndexFinder.h"

SPEC_BEGIN(ToptalExerciseSpec)
        describe(@"ToptalExercise", ^{
            // Understanding: given a target, find the index where the value of the number at that index is equal to the
            // number of non-target-matching items ahead and also equal to the number of target-matching items behind

            // If Target = 5
            // Find index, K, such that the value at input[K] == # of items ahead not equal to 5 == # of items behind equal to 5
            // * Items ahead not equal to target include the value at input[K]

            // With this test, K=4
            // value at input[4] = 2 = items ahead not equal to 5 == items behind equal to 5
            it(@"should work with sample input", ^{
                NSMutableArray *array = [@[@(5), @(5), @(1), @(7), @(2), @(3), @(5)] mutableCopy];
                MidIndexFinder *exercise = [[MidIndexFinder alloc] initWithThing:array];
                long result = [exercise findFor:5];
                [[@(result) should] equal:@(4)];
            });

            describe(@"cases where there are no result", ^{
                it(@"non matching elements ahead and zero non-matching behind", ^{
                    //so with this one, while evaluating 12 at index 1, there is one non matching ahead and zero matching behind
                    //meaning this cannot be the index, 1 != 0 even if our value did have one of these numbers

                    //so with this one, while evaluating 3 at index 0, there are two non matching ahead and zero matching behind
                    //meaning this cannot be the index, 1 != 0 even if our value did have one of these numbers
                    MidIndexFinder *exercise = [[MidIndexFinder alloc] initWithThing:[@[@(3), @(12)] mutableCopy]];
                    long result = [exercise findFor:5];

                    // so there is no result
                    [[@(result) should] equal:@(-1)];
                });

                // for this on the element at index=2 could be the one to return.. if it's value was 1 instead of 12
                it(@"zero elements ahead and one matching behind", ^{
                    MidIndexFinder *exercise = [[MidIndexFinder alloc] initWithThing:[@[@(5), @(3), @(12)] mutableCopy]];
                    long result = [exercise findFor:5];

                    // so there is no result
                    [[@(result) should] equal:@(-1)];
                });
            });

            it(@"one item input where criteria can be met", ^{
                MidIndexFinder *exercise = [[MidIndexFinder alloc] initWithThing:[@[@(0)] mutableCopy]];
                long result = [exercise findFor:0];
                [[@(result) should] equal:@(0)];
            });

            it(@"should handle small input where criteria are met - one non matching ahead and 1 matching behind", ^{
                MidIndexFinder *exercise = [[MidIndexFinder alloc] initWithThing:[@[@(5), @(1)] mutableCopy]];
                long result = [exercise findFor:5];
                [[@(result) should] equal:@(1)];
            });

            it(@"should work with large input", ^{
                NSMutableArray *array = [@[@(100000), @(100000), @(1), @(7), @(2), @(3), @(100000)] mutableCopy];
                MidIndexFinder *exercise = [[MidIndexFinder alloc] initWithThing:array];
                long result = [exercise findFor:100000];
                [[@(result) should] equal:@(4)];
            });

        });
SPEC_END
