//
//  NSMutableArray+HeapSort.m
//  Algorithms
//
//  Created by Julietta Yaunches on 9/29/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import "NSMutableArray+HeapSort.h"

// Relies on MAX-Heap data structure
//         40
//       /    \
//     20     15
//    / \     / \
//   9   17  8   15
//  / \
// 1   3
//
// This would correspond to the following array
// of data for every position i:
//         1  2  3  4 5  6 7  8 9
//        |40|20|15|9|17|8|15|1|3|
// Level: |1 |2    |3        |4

@implementation NSMutableArray (HeapSort)

-(void)rangesIntersect{
    NSRange range = NSMakeRange(1, 3);

}

@end
