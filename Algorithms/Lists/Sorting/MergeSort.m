//
//  MergeSort.m
//  Algorithms
//
//  Created by Julietta Yaunches on 9/15/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <ObjectiveSugar/NSArray+ObjectiveSugar.h>
#import "MergeSort.h"
#import "NSArray+Helpers.h"
#import "NSMutableArray+QueueHelper.h"

@implementation MergeSort

// Algorithm:
// Given a list/array that is unsorted
// Recursively divide the list into halves until you have arrays with one item.
// On return from recursive division, merge the 2 arrays based on the first item in each array.
// Merging is also recursive as when you merge 2 arrays with more than one item, merge is called
// recursively to merge the remaining items in each array.

// Recursion to sort & recursion to merge. Double RECURSION. OMG. Lol.
// Merge doesn't necessary need to be done recursively

// Analysis:
// Best & Worst: O(n log n).
// log n for dividing the array into smaller arrays.. each time by 1/2
// n for the merging.. every item needs to be reviewed as merge occurs

+ (NSMutableArray *)sort:(NSMutableArray *)array {
    if (array.count == 1) {
        return array;
    }    
    NSUInteger midPoint = [array count] / 2;

    NSMutableArray *leftToBeSorted = [array subarrayFrom:0 to:midPoint];
    NSMutableArray *rightToBeSorted = [array subarrayFrom:midPoint to:[array count]];

    NSMutableArray *left = [self sort:leftToBeSorted];
    NSMutableArray *right = [self sort:rightToBeSorted];

    return [self merge:left with:right];
}

+ (NSMutableArray *)merge:(NSMutableArray *)left with:(NSMutableArray *)right {
    if([left isEmpty]){
        return right;
    }else if([right isEmpty]){
        return left;
    }else if([left firstNumber] < [right firstNumber]){
        NSMutableArray *remainingMerged = [self merge:[left subarrayFrom:1 to:left.count] with:right];
        return [[@[left[0]] arrayByAddingObjectsFromArray:remainingMerged] mutableCopy];
    }else{
        NSMutableArray *remainingMerged = [self merge:left with:[right subarrayFrom:1 to:right.count]];
        return [[@[right[0]] arrayByAddingObjectsFromArray:remainingMerged] mutableCopy];
    }    
}

@end
