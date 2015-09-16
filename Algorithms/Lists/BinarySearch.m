//
//  BinarySearch.m
//  Algorithms
//
//  Created by Julietta Yaunches on 9/15/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import "BinarySearch.h"
#import "NSArray+Helpers.h"

@implementation BinarySearch

+ (int)basicSearch:(NSArray *)array forItem:(NSNumber *)target {
    NSUInteger highBoundary = array.count;
    NSUInteger lowBoundary = 0;

    if([array isEmpty] || target == nil){
        return -1;
    }

    while(highBoundary != lowBoundary){
        NSUInteger mid = ((highBoundary - lowBoundary)/2) + lowBoundary;
        NSNumber *itemToInspect = array[mid];
        if([itemToInspect isEqualToNumber:target]){
            return (int)mid;
        }else if(itemToInspect.intValue > target.intValue){
            highBoundary = mid-1;
        }else if(itemToInspect.intValue < target.intValue){
            lowBoundary = mid+1;
        }
    }
    
    return -1;
}

//example: 3 4 5 6 7 1 2
//example: 6 7 1 2 3 4 5
+ (NSNumber *)minElementIn:(NSArray *)array {
    NSNumber *knownLow = array[0];

    int bottom = 0;
    int top = (int)array.count;

    while(bottom != top){
        int mid = ((top -bottom)/2) + bottom;
        NSNumber *midElement = array[mid];
        if(midElement.intValue < knownLow.intValue){
            knownLow = midElement;
            top = mid-1;
        }else if(midElement.intValue > knownLow.intValue){
            bottom = mid+1;
        }
    }

    return knownLow;
}
@end
