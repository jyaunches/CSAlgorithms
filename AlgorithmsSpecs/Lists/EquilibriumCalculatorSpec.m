//
//  EquilibriumCalculatorSpec.m
//  Algorithms
//
//  Created by Julietta Yaunches on 10/23/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//
#import <Kiwi/Kiwi.h>
#import "EquilibriumCalculator.h"

SPEC_BEGIN(EquilibriumCalculatorSpec)
        describe(@"EquilibriumCalculator", ^{
            it(@"should work with sample input", ^{
                NSMutableArray *input = [@[@(-1), @(3), @(-4), @(5), @(1), @(-6), @(2), @(1)] mutableCopy];

                EquilibriumCalculator *calculator = [[EquilibriumCalculator alloc] initWithArray:input];
                int equilibriumIndex = [calculator findEquilibrium];

                [[@(equilibriumIndex) should] equal:@(7)];
            });

            it(@"should return position 0 for two items where second is 0", ^{
                NSMutableArray *input = [@[@(-1), @(0)] mutableCopy];

                EquilibriumCalculator *calculator = [[EquilibriumCalculator alloc] initWithArray:input];
                int equilibriumIndex = [calculator findEquilibrium];

                [[@(equilibriumIndex) should] equal:@(0)];
            });
            
            it(@"should return position 0 for two items where first is 0", ^{
                NSMutableArray *input = [@[@(0), @(-1)] mutableCopy];
                
                EquilibriumCalculator *calculator = [[EquilibriumCalculator alloc] initWithArray:input];
                int equilibriumIndex = [calculator findEquilibrium];
                
                [[@(equilibriumIndex) should] equal:@(1)];
            });

            it(@"should return position 0 for 1 object array", ^{
                NSMutableArray *input = [@[@(0)] mutableCopy];

                EquilibriumCalculator *calculator = [[EquilibriumCalculator alloc] initWithArray:input];
                int equilibriumIndex = [calculator findEquilibrium];

                [[@(equilibriumIndex) should] equal:@(0)];
            });

            it(@"should return -1 when no equilibrium found", ^{
                NSMutableArray *input = [@[@(-1), @(1)] mutableCopy];

                EquilibriumCalculator *calculator = [[EquilibriumCalculator alloc] initWithArray:input];
                int equilibriumIndex = [calculator findEquilibrium];

                [[@(equilibriumIndex) should] equal:@(-1)];
            });


            it(@"should work with extremely large numbers", ^{
                NSMutableArray *input = [@[@(100), @(4294967196), @(2)] mutableCopy];

                EquilibriumCalculator *calculator = [[EquilibriumCalculator alloc] initWithArray:input];
                int equilibriumIndex = [calculator findEquilibrium];

                [[@(equilibriumIndex) should] equal:@(-1)];
            });
        });
SPEC_END