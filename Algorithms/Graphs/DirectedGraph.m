//
//  DirectedGraph.m
//  Algorithms
//
//  Created by Julietta Yaunches on 10/5/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <ObjectiveSugar/ObjectiveSugar.h>
#import "DirectedGraph.h"
#import "NSMutableArray+QueueHelper.h"

// A directed graph is a graph in which:
//   * a given node can have 0 - ~ children
//   * it can contain loops
//   * not all nodes have to have a route to all other nodes
@implementation DirectedGraph

// Because a given node can have many children, a BFS makes the most sense
// as the targets could be quite near each other.

// Asymptotic Analysis:
// Best case: O(1) <- we find our target at the root
// Worse case: O(E) <- Where E is the number of edges and we find our target on the last edge searched

+ (BOOL)routeExistsFrom:(GraphNode *)origin to:(GraphNode *)destination {
    if(!origin || !destination)
        return NO;

    if(origin == destination)
        return YES;

    NSMutableArray *queue = [@[origin] mutableCopy];

    while(queue.count > 0){
        GraphNode *current = queue.pop;
        if(!current.visited){
            current.visited = YES;
            if(current == destination){
                return YES;
            }
            [queue pushObjects:current.children];
        }
    }
    return NO;
}

// 1. Give node’s a distance property, set it to 0 for start node.
// 2. Use visited flag and start all nodes as unvisited
// 3. BFS visiting first start node then it’s children, incrementing distance and marking as visited.
// 4. Stop when destination found

// My searching closest nodes first, we can ensure that if we run into the same node later, it will not be closer
// to the origin and thus doesn't need to be visited again.

// Analysis:
// Worst case:
// time O(n) - may need to visit all nodes to find the destination
// space O(n) - may need to hold all the nodes in the queue

+ (NSNumber *)shortestPathFrom:(GraphNode *)origin to:(GraphNode *)destination {
    origin.distanceFromOrigin = 0;
    NSMutableArray *queue = [@[origin] mutableCopy];

    if(queue.count == 0){
        return nil; //or throw error
    }
    if(destination == nil){
        return nil; //or throw error
    }

    while(queue.count > 0){
        GraphNode *nextEval = [queue pop];
        if(nextEval != nil && !nextEval.visited){
            nextEval.visited = YES;
            if(nextEval == destination){
                return @(nextEval.distanceFromOrigin);
            }else{
                [nextEval.children each:^(GraphNode *child) {
                    child.distanceFromOrigin = nextEval.distanceFromOrigin+1;
                }];
                [queue pushObjects:nextEval.children];
            }
        }
    }

    return nil; //destination not found
}

@end
