//
//  ToptalExerciseSpec.m
//  Algorithms
//
//  Created by Julietta Yaunches on 10/23/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//
#import <Kiwi/Kiwi.h>
#import "MidIndexExercise.h"

SPEC_BEGIN(MidIndexExerciseSpec)
        describe(@"MidIndexExercise", ^{

            it(@"should work with sample input", ^{
                NSMutableArray *array = [@[@(5), @(5), @(1), @(7), @(2), @(3), @(5)] mutableCopy];
                MidIndexExercise *exercise = [[MidIndexExercise alloc] initWithArray:array];
                long result = [exercise findFor:5];
                [[@(result) should] equal:@(4)];
            });

            it(@"should return K as N, (size of array) when zero matching for whole array", ^{
                MidIndexExercise *exercise = [[MidIndexExercise alloc] initWithArray:[@[@(3), @(12)] mutableCopy]];
                long result = [exercise findFor:5];

                [[@(result) should] equal:@(2)];
            });

            it(@"should return index relative to one non matching ahead one matching behind", ^{
                MidIndexExercise *exercise = [[MidIndexExercise alloc] initWithArray:[@[@(5), @(3), @(12)] mutableCopy]];
                long result = [exercise findFor:5];

                // so there is no result
                [[@(result) should] equal:@(2)];
            });

            it(@"should return index 0 when array has one item that matches target -> for zero matching behind zero non matching ahead", ^{
                MidIndexExercise *exercise = [[MidIndexExercise alloc] initWithArray:[@[@(7)] mutableCopy]];
                long result = [exercise findFor:7];
                [[@(result) should] equal:@(0)];
            });

            it(@"should work with large input", ^{
                NSMutableArray *array = [@[@(100000), @(100000), @(1), @(7), @(2), @(3), @(100000)] mutableCopy];
                MidIndexExercise *exercise = [[MidIndexExercise alloc] initWithArray:array];
                long result = [exercise findFor:100000];
                [[@(result) should] equal:@(4)];
            });

        });
SPEC_END
