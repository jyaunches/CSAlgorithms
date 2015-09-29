//
//  NSMutableArray+SelectionSort.m
//  Algorithms
//
//  Created by Julietta Yaunches on 9/28/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import "NSMutableArray+SelectionSort.h"
#import "NSMutableArray+QueueHelper.h"

// Strategy: Move through list incrementally selecting the smallest item
// item from n - 1. Where n is the length of the list. With each iteration,
// take the lowest found item and insert it at the index of n - 1.
//
// Analysis: From the comparions presented here, one might conclude that selection
// sort should never be used. It does not adapt to the data in any way (notice
// that the four animations above run in lock step), so its runtime is always quadratic.
//
// However, selection sort has the property of minimizing the number of swaps.
// In applications where the cost of swapping items is high, selection sort very well
// may be the algorithm of choice.
//
// * Not Stable
// * O(1) extra space
// * O(n2) comparisons
// * O(n) swaps
// * Not adaptive

@implementation NSMutableArray (SelectionSort)

//given starting index at front of array
//move through array and find minimum
//insert minimum at original starting index
//increment starting index
//repeat until starting index at n-1

- (void)selectionSort{

    for(int startingIndex = 0; startingIndex < self.count-1; startingIndex++){
        NSArray *current = [self subarrayFrom:startingIndex to:self.count];
        int minIndex = 0;
        for(int i=1; i<current.count; i++){
            if(current[i] < current[minIndex]){
                minIndex = i;
            }
        }

        NSNumber *minItem = current[minIndex];
        [self removeObjectAtIndex:startingIndex+minIndex];
        [self insertObject:minItem atIndex:startingIndex];
    }

}
@end
