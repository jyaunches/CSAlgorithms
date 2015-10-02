//
//  BadNeighborsSpec.m
//  Algorithms
//
//  Created by Julietta Yaunches on 9/15/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "BadNeighbors.h"

SPEC_BEGIN(BadNeighborsSpec)
    describe(@"BadNeighbors", ^{

        it(@"should determine highest donation combination", ^{
            NSArray *donations = @[@(10), @(3), @(2), @(5), @(7), @(8)];

            BadNeighbors *badNeighbors = [[BadNeighbors alloc] init];
            NSNumber *result = [badNeighbors findHighest:donations];

            [[result should] equal:@(19)];
        });

    });
SPEC_END

