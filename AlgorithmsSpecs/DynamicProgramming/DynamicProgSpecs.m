//
//  AlgorithmsSpecs.m
//  AlgorithmsSpecs
//
//  Created by Julietta Yaunches on 9/13/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "DigitSum.h"
#import "DynamicProg.h"

SPEC_BEGIN(DynamicProgrammingSpec)
        describe(@"DynamicProg", ^{

            xit(@"should count n digit numbers whose sum of digits is equal to given sum", ^{
                NSNumber *number = @([DigitSum countSumsWithNumberOfDigits:2 forTarget:5]);
                [[number should] equal:@(5)];
            });

            it(@"should find min number of coins for sum", ^{
                NSArray *coins = @[@(1), @(3), @(5)];
                NSArray *minCoinsForSum = [DynamicProg find:coins forSum:@(11)];

                [[@(minCoinsForSum.count) should] equal:@(3)];
            });

            it(@"should find longest non-decreasing sequence using DP", ^{
                NSArray *randomSeq = @[@(5), @(3), @(4), @(8), @(2), @(12), @(6), @(7), @(9), @(11)];

                NSNumber *length = [DynamicProg findLengthOfNonDecreasingSequence:randomSeq];
                [[length should] equal:@(4)];
            });

            describe(@"zigzag", ^{
                it(@"case 1", ^{
                    NSArray *originalSequence = @[@(1), @(17), @(5), @(10), @(13), @(15), @(10), @(5), @(16), @(8)];

                    NSNumber *lengthOfZigZag = [DynamicProg findZigZagLength:[originalSequence mutableCopy]];
                    [[lengthOfZigZag should] equal:@(7)];
                });

                it(@"case 2", ^{
                    NSArray *originalSequence = @[@(1), @(2), @(3), @(4), @(5), @(6), @(7), @(8), @(9)];

                    NSNumber *lengthOfZigZag = [DynamicProg findZigZagLength:[originalSequence mutableCopy]];
                    [[lengthOfZigZag should] equal:@(2)];
                });

                it(@"case 3", ^{
                    NSArray *originalSequence = @[@(70), @(55), @(13), @(2), @(99), @(2), @(80), @(80),
                            @(80), @(80), @(100), @(19), @(7), @(5), @(5), @(5), @(1000), @(32), @(32)];

                    NSNumber *lengthOfZigZag = [DynamicProg findZigZagLength:[originalSequence mutableCopy]];
                    [[lengthOfZigZag should] equal:@(8)];
                });

                it(@"case 4", ^{
                    NSArray *originalSequence = @[@(374), @(40), @(854), @(203), @(203), @(156), @(362), @(279), @(812), @(955),
                            @(600), @(947), @(978), @(46), @(100), @(953), @(670), @(862), @(568), @(188),
                                    @(67), @(669), @(810), @(704), @(52), @(861), @(49), @(640), @(370), @(908),
                                    @(477), @(245), @(413), @(109), @(659), @(401), @(483), @(308), @(609), @(120),
                                    @(249), @(22), @(176), @(279), @(23), @(22), @(617), @(462), @(459), @(244)];

                    NSNumber *lengthOfZigZag = [DynamicProg findZigZagLength:[originalSequence mutableCopy]];
                    [[lengthOfZigZag should] equal:@(36)];
                });


            });


        });

SPEC_END