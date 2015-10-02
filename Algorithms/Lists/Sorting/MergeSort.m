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
