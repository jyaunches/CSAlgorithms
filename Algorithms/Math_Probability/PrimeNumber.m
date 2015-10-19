//
//  PrimeNumber.m
//  Algorithms
//
//  Created by Julietta Yaunches on 10/12/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <ObjectiveSugar/ObjectiveSugar.h>
#import "PrimeNumber.h"

@implementation PrimeNumber

// Notes:
// Asymptotic Analysis:
// n (initial population of array) + ~n removals == ~2n operations
// O(n)

+ (NSArray *)getPrimesUnder:(int)input {
    NSMutableArray *candidates = [@[@(2)] mutableCopy];

    //populate initial candidates based on 2
    for (int i = 3; i <= input; i++) {
        //add candidate if it's not divisible by 2
        if ((i % 2) > 0) {
            [candidates addObject:@(i)];
        }
    }

    //refine candidates
    NSUInteger curEvalIndex = 1;  // should point to next candidate after 2 -> i.e. 3
    NSNumber *curPrime = candidates[curEvalIndex];

    // We can stop when our currently evaluating prime number has reached the square root of the input
    // because:
    // sqrt(input) = n where -> n*n = input
    // thus:
    //   if n happens to be a prime number, we will have evaluated n and all multiples of n
    //   if n is not a prime number, we will have evaluated all the prime numbers under it
    //
    // so:
    //   by evaluating the multiples of all the primes under n we will have reached all numbers that are non-primes(multiples of other primes)
    
    // Input: 73
    // Non prime sub-numbers:
    // 49 = 2^0 * 3^0 * 5^0 * 7^2 * 11^0 *  ...
    // 57 = 2^0 * 3^1 * 5^0 * 7^2 * 11^0 * 13^0 * 17^0 * 19^1 *  ...

    // sqrt(73) = 8.5
    // Last prime number to evaluate will be 7
    // -> since 7^7 = 49... we can be confident that all non prime numbers between
    // 49 and 73 will have been eliminated because they must contain a divisor of a
    // prime number <= 7
    // Because.... all non prime numbers are multiples of 2 other prime numbers...
    // In this example the next prime number after 7 is 13... now there may be numbers
    // between 49 and 73 that are multiples of 13... but that multiplier would have to be < 7
    // meaning as long as we evaluated the lower primes, we will have already removed it

    while (curPrime.doubleValue <= sqrt(input)) {
        // remove all multiples of a given prime number

        int removals = 0;
        for (int i = curPrime.intValue * curPrime.intValue; i < input; i += curPrime.intValue) {
            [candidates removeObject:@(i)];
            removals++;
        }
        NSLog(@"Removals: %i", removals);

        curEvalIndex++;
        curPrime = candidates[curEvalIndex];
    }
    return candidates;
}
@end
