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

+ (NSArray *)getPrimesUnder:(int)input {
    NSMutableArray *candidates = [@[@(2)] mutableCopy];

    //populate initial candidates based on 2
    for(int i=3; i<=input; i++){
        //add candidate if it's not divisible by 2
        if((i % 2) > 0) {
            [candidates addObject:@(i)];
        }
    }

    //refine candidates
    NSUInteger curEvalIndex = 1;  // should point to next candidate after 2 -> i.e. 3
    NSNumber *curEval = candidates[curEvalIndex];
    double d = sqrt(input);
    while((curEvalIndex < candidates.count) && (curEval.doubleValue <= d)){
        for(NSUInteger i = curEvalIndex+1; i < candidates.count; i++){
            NSNumber *nextNum = candidates[i];
            //remove candidate it can be divided by the current evaluating prime number
            if((nextNum.intValue % curEval.intValue) == 0){
                [candidates removeObject:nextNum];
            }
        }
        curEvalIndex++;
        curEval = candidates[curEvalIndex];
    }
    return candidates;
}
@end
