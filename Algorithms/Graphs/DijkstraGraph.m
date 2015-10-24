
//
//  DijkstraShortestPath.m
//  Algorithms
//
//  Created by Julietta Yaunches on 10/21/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <ObjectiveSugar/ObjectiveSugar.h>
#import "DijkstraGraph.h"
#import "WeightedChildNode.h"
#import "NSMutableArray+QueueHelper.h"

// Implementation of basic Dijkstra's Algorithm

// Algorithm:
// * Graph expects all nodes to have been added with each node knowing it's children and the weight of the
// edge to each child. (See test class for setup example.)
// * On call to shortestWeightedPathFrom: origin to:destination
//    1. Give node’s a weightFromOrigin property, set it to 0 for origin, set it to infinity for all rest.
//    2. Put all nodes into an array with the origin node as the first.
//    3. Visit all nodes and update their children’s weight if their weight, plus the weight of the edge to the child
//       is less than the current child’s weight.
//    4. Return the weight of the destination. (Should have been updated by one of it's parents to the lowest weight)

// * All edges must be visited to ensure the lowest weight is found so no visited flag is necessary

// Analysis:
// O(E) where E is the total number of edges. All edges must be visited.

@interface DijkstraGraph ()
@property(nonatomic, strong) NSMutableArray *nodes;
@end

@implementation DijkstraGraph

-(id)init{
    self = [super init];
    self.nodes = [@[] mutableCopy];
    return self;
}

- (int)shortestWeightedPathFrom:(GraphNode *)origin to:(GraphNode *)destination {
    if(origin == nil || destination == nil || ![self.nodes containsObject:origin] || ![self.nodes containsObject:destination]){
        return INT_MAX;
    }
    origin.weightFromOrigin = 0;

    NSMutableArray *searchQueue = [NSMutableArray arrayWithArray:self.nodes];
    [searchQueue moveObjectToFront:origin];

    while(searchQueue.count > 0){
        GraphNode *currentEval = [searchQueue shift];
        [currentEval.children each:^(WeightedChildNode *child) {
            [child updateWeightFromOriginGivenParent:currentEval];
        }];
    }
    return destination.weightFromOrigin;
}

- (void)addNode:(GraphNode *)node {
    [self.nodes addObject:node];
}
@end
