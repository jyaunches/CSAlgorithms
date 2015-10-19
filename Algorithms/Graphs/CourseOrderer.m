//
//  GraphSort.m
//  Algorithms
//
//  Created by Julietta Yaunches on 9/14/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <ObjectiveSugar/NSArray+ObjectiveSugar.h>
#import <ObjectiveSugar/NSMutableArray+ObjectiveSugar.h>
#import "CourseOrderer.h"
#import "GraphNode.h"

// University courses often have prerequisites that must be completed before
// a student can register for the course.

@implementation CourseOrderer

// This method takes a list of nodes in a dependency tree where each node represents a course that
// must be attended before subsequent child (or adjacent) node/courses.

// Example input graph
//        142
//         |
//        143
//   /  /  |   \
// 378 370 341 321
//  |       |   |  \
// 401     401 326 322
//            / |    | \
//         401 421  401 421

// Solution: Topological Sort
// Algorithm:
//   -> find nodes with no incoming edges
//   -> loop through these checking each children
//        -> if child has other incoming, remove current node as parent and remove the child from the parent
//           (this leaves the insertion into the sorted array to the last parent remaining)
//        -> if child has no other incoming, add it to the list of startingEdges
//           (ensures that the child is not added to the sorted array until all of it's dependencies have also been added)

// Asymptotic Analysis:
// (identifying starting nodes) n + visiting every edge E

- (NSArray *)sortCourses:(NSArray *)nodes {
    NSMutableArray *startingNodes = [[nodes select:^BOOL(GraphNode *node) {
        return node.incoming.count == 0;
    }] mutableCopy];

    NSMutableArray *orderedCourses = [@[] mutableCopy];

    while (startingNodes.count > 0) {
        GraphNode *edge = [startingNodes pop];
        [orderedCourses push:edge];

        [edge.children each:^(GraphNode *childNode) {
            [childNode removeIncoming:edge];
            //this was the last parent
            if(childNode.incoming.count == 0){
                [startingNodes push:childNode];
            }
        }];
    }

    return orderedCourses;
}
@end
