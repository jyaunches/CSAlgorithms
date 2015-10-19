//
//  DirectedGraph.m
//  Algorithms
//
//  Created by Julietta Yaunches on 10/5/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <ObjectiveSugar/ObjectiveSugar.h>
#import "DirectedGraph.h"
#import "GraphNode.h"
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
@end
