//
//  ToptalExerciseSpec.m
//  Algorithms
//
//  Created by Julietta Yaunches on 10/23/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//
#import <Kiwi/Kiwi.h>
#import "StepExercise.h"

SPEC_BEGIN(StepExerciseSpec)
        describe(@"StepExercise", ^{
            __block StepExercise *exercise;

            beforeAll(^{
                NSArray *step1 = @[@(0), @(1)];
                NSArray *step2 = @[@(2), @(0)];
                NSArray *step3 = @[@(1), @(2)];
                NSArray *step4 = @[@(-1), @(1)];
                NSArray *step5 = @[@(1), @(-1)];
                NSMutableArray *moves = [@[step1, step2, step3, step4, step5] mutableCopy];
                exercise = [[StepExercise alloc] initWithMoves:moves];
            });

            it(@"should return first step when given first path stop coordinates", ^{
                int result = [exercise findFor:@[@(0), @(1)]];
                [[@(result) should] equal:@(1)];
            });

            it(@"should return fourth step when given fourth path stop coordinates", ^{
                int result = [exercise findFor:@[@(2), @(4)]];
                [[@(result) should] equal:@(4)];
            });

            it(@"should return the first step when given two steps have landed on the same coordinates", ^{
                int result = [exercise findFor:@[@(3), @(3)]];
                [[@(result) should] equal:@(3)];
            });
        });
SPEC_END
