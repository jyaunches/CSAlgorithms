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
//     * a given node and have 0 - ~ children
//     * it can contain loops
//     * not all nodes have to have a route to all other nodes
@implementation DirectedGraph

// As a given node can have many children, a BFS makes the most sense
// as the targets could be quite near each other.
+ (BOOL)routeExistsFrom:(GraphNode *)node1 to:(GraphNode *)node2 {
    if(!node1 || !node2)
        return NO;

    if(node1 == node2)
        return YES;

    NSMutableArray *queue = [@[node1] mutableCopy];

    while(queue.count > 0){
        GraphNode *current = queue.pop;
        if(!current.visited){
            current.visited = YES;
            if(current == node2){
                return YES;
            }
            [queue pushObjects:current.adjacentEdges];
        }
    }
    return NO;
}
@end
