//
//  DigitSum.m
//  Algorithms
//
//  Created by Julietta Yaunches on 9/13/15.
//  Copyright © 2015 yaunches. All rights reserved.
//

#import <ObjectiveSugar/ObjectiveSugar.h>
#import "DigitSum.h"

@implementation DigitSum

// Problem: given a provided target, and a given number of digits to work with,
// count the number of sums that will add up to the target.
// Example: digits: 2, target: 5
// Result: 1+4, 2+3, 0+5   <- should return 3 for this input

+ (int)countSumsWithNumberOfDigits:(int)digits forTarget:(int)target {
    int numberOfResults = 0;

    // Traverse through every digit from 1 to
    // 9 and count numbers beginning with it
    for (int i = 0; i <= 9; i++)
        if (target-i >= 0)
            numberOfResults += [self getCount:digits - 1 sum:target - i];

    return numberOfResults;
}

+ (int)getCount:(int)digits sum:(int)sum {
    if(digits == 0){
        if(sum == 0){
            return 1;
        }else {
            return 0;
        }
    }

    __block int numberOfResults = 0;

    for (int index=0; index<=9; index++){
        if(sum-index >= 0){
            numberOfResults += [self getCount:digits - 1 sum:sum - index];
        }
    }

    return numberOfResults;
}

@end
