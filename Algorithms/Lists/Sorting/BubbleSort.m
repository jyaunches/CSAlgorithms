//
//  BubbleSort.m
//  Algorithms
//
//  Created by Julietta Yaunches on 9/28/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import "BubbleSort.h"
#import "NSNumber+Helpers.h"

@implementation BubbleSort

// Strategy: Repeatedly steps through the list to be sorted, compare
// each pair of adjacent items and swap them if they are in the wrong order.

// Analysis: Bubble sort has many of the same properties as insertion sort,
// but has slightly higher overhead. In the case of nearly sorted data,
// bubble sort takes O(n) time, but requires at least 2 passes through
// the data (whereas insertion sort requires something more like 1 pass).

// Analysis:
// * Stable
// * Worst O(n^2) comparisons and swaps
//          Consider: 6, 2, 3, 4, 5
//          It will take 5 passes and 5 comparisons/pass to move 6 to the end
// * Adaptive: O(n) when nearly sorted

+ (NSArray *)sort:(NSMutableArray *)array {
    while([self runIteration:array]){
        NSLog(@"bubble sort: array iteration made");
    }
    return array;
}

+ (BOOL)runIteration:(NSMutableArray *)array {
    BOOL swapFound = NO;
    for(int i=1; i<array.count; i++){
            NSNumber *firstItem = array[i-1];
            NSNumber *secondItem = array[i];
            if([secondItem isLessThan:firstItem]){
                array[i] = firstItem;
                array[i-1] = secondItem;
                swapFound = YES;
            }
        }
    return swapFound;
}
@end
