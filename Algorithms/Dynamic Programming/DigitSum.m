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

+ (int)finalCount:(int)digits withSum:(int)sum {
    //digits = 2
    //sum = 5
    //a result = 14

    int numberOfResults = 0;

    // Traverse through every digit from 1 to
    // 9 and count numbers beginning with it
    for (int i = 0; i <= 9; i++)
        if (sum-i >= 0)
            numberOfResults += [self getCount:digits - 1 sum:sum - i];

    return numberOfResults;

}

@end
