//
//  NSMutableArray+InsertionSort.m
//  Algorithms
//
//  Created by Julietta Yaunches on 9/28/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import "NSMutableArray+InsertionSort.h"
#import "NSNumber+Helpers.h"

// Strategy: Move through list looking at two items at a time.
// When unsorted items found, take lower item and move it back
// towards front of list until it can be inserted between a relative
// high and low value

// Analysis: Although it is one of the elementary sorting algorithms
// with O(n2) worst-case time, insertion sort is the algorithm of choice
// either when the data is nearly sorted (because it is adaptive) or
// when the problem size is small (because it has low overhead).
//
// For these reasons, and because it is also stable, insertion sort is
// often used as the recursive base case (when the problem size is small)
// for higher overhead divide-and-conquer sorting algorithms, such as
// merge sort or quick sort.
// * Stable
// * O(1) extra space
// * O(n^2) comparisons and swaps
// * Adaptive: O(n) when nearly sorted

@implementation NSMutableArray (InsertionSort)
- (NSArray *)insertionSort {
    for (int forwardIndex = 1; forwardIndex < self.count; forwardIndex++) {
        int reversingIndex = forwardIndex;
        while ((reversingIndex > 0) && [self itemAtIndexOutOfOrder:reversingIndex]) {
            [self compareAndSwapAtIndex:reversingIndex];
            reversingIndex--;
        }
    }
    return self;
}

- (BOOL)itemAtIndexOutOfOrder:(int)i {
    NSNumber *currentItem = self[i];
    NSNumber *earlierItem = self[i - 1];

    return [currentItem isLessThan:earlierItem];
}

- (void)compareAndSwapAtIndex:(int)i {
    NSNumber *currentItem = self[i];
    NSNumber *earlierItem = self[i - 1];

    self[i - 1] = currentItem;
    self[i] = earlierItem;
}
@end
