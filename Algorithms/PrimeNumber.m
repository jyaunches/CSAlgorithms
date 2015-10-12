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
    NSNumber *curEval = candidates[curEvalIndex];


    while ((curEvalIndex < candidates.count) && (curEval.doubleValue <= sqrt(input))) {
        for (int i = curEval.intValue * curEval.intValue; i < input; i += curEval.intValue) {
            [candidates removeObject:@(i)];
        }

        curEvalIndex++;
        curEval = candidates[curEvalIndex];
    }
    return candidates;
}
@end
