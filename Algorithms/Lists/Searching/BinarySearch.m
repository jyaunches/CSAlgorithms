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

// Binary search is both:
// A Divide and Conquer Algorithm
//      defined as: based on multi-branched recursion. A divide and conquer algorithm works by recursively
//                  breaking down a problem into two or more sub-problems of the same (or related) type (divide),
//                  until these become simple enough to be solved directly (conquer). The solutions to the
//                  sub-problems are then combined to give a solution to the original problem.
// A Dichotomic search algorithm
//      defined as: operates by selecting between two distinct alternatives (dichotomies) at each step

// Algorithm: given a sorted array, and a target to search for, begin with inspecting the middle element.
// If target is higher, repeat search in the top half of the input array. Repeat until target found.

+ (int)search:(NSArray *)array forItem:(NSNumber *)target {
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

// Finding the minimum element in a shifted, sorted array
// Example input: 3 4 5 6 7 1 2
// Example input: 6 7 1 2 3 4 5
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
