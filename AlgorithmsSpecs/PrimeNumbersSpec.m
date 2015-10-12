//
//  PrimeNumbersSpec.m
//  Algorithms
//
//  Created by Julietta Yaunches on 10/12/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "PrimeNumber.h"

SPEC_BEGIN(PrimeNumbersSpec)
        describe(@"PrimeNumbers", ^{
            it(@"should determine all prime numbers under a given input", ^{
                NSArray *results = [PrimeNumber getPrimesUnder:73];
                [[@(results.count) should] equal:@(21)];
            });
        });

SPEC_END
