//
//  GraphSort.m
//  Algorithms
//
//  Created by Julietta Yaunches on 9/14/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <ObjectiveSugar/NSArray+ObjectiveSugar.h>
#import "GraphSort.h"
#import "GraphEdge.h"

@implementation GraphSort

- (NSArray *)topologicalSort:(NSArray *)edges {
    GraphEdge *startingEdge = [edges find:^BOOL(GraphEdge *edge) {
        return edge.incoming == 0;
    }];

    NSMutableArray *remainingEdges = [edges mutableCopy];
    [remainingEdges removeObject:startingEdge];

    NSMutableArray *coursesInOrder = [@[startingEdge] mutableCopy];

    while (remainingEdges.count > 0) {
        [remainingEdges each:^(GraphEdge *potentialEdge) {
            GraphEdge *found = [coursesInOrder find:^BOOL(GraphEdge *foundEdge) {
                return foundEdge.destination == potentialEdge.incoming;
            }];

            if(found){
                NSUInteger insertIndex = [coursesInOrder indexOfObject:found] + 1;
                if(coursesInOrder.count > insertIndex){
                    GraphEdge *nextKnownEdge = coursesInOrder[insertIndex];

                    while ((potentialEdge.destination > nextKnownEdge.destination) && (coursesInOrder.count > insertIndex + 1)) {
                        insertIndex += 1;
                        nextKnownEdge = coursesInOrder[insertIndex];
                    }
                }


                [coursesInOrder insertObject:potentialEdge atIndex:insertIndex];
            }

        }];
        [remainingEdges removeObjectsInArray:coursesInOrder];
    }

    NSArray *sortedEdges = [coursesInOrder map:^id(GraphEdge *sortedEdge) {
        return @(sortedEdge.destination);
    }];
    return [[NSOrderedSet orderedSetWithArray:sortedEdges] array];
}
@end
