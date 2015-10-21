//
//  DijkstraShortestPathSpec.m
//  Algorithms
//
//  Created by Julietta Yaunches on 10/21/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "GraphNode.h"
#import "DijkstraGraph.h"

SPEC_BEGIN(DijkstraShortestPathSpec)
describe(@"DijkstraShortestPath", ^{
    // Graph with weights
    //           14
    //       3/ 6| 5\ <--weight
    //       /   |   \
    //      7    5   21 <--node
    //    3/   9/ 3\
    //    /    /    \
    //  11    4     21
    //  3\
    //    \
    //     4

    // In this graph the shortest distance without weights between 14 & 4 is 14->5->4
    // However, this path has a weight of 6+9=15
    // There is an alternative path 14->7->11->4 with a weight of 3+3+3=9. LOWER
    it(@"should determine shortest weighted path between 14 and 4 as 14->7->11->4 with a weight of 9", ^{
        GraphNode *node14 = [[GraphNode alloc] initWithValue:14];
        GraphNode *node7 = [[GraphNode alloc] initWithValue:7];
        GraphNode *node5 = [[GraphNode alloc] initWithValue:7];
        GraphNode *node21 = [[GraphNode alloc] initWithValue:7];
        GraphNode *node11 = [[GraphNode alloc] initWithValue:7];
        GraphNode *node4 = [[GraphNode alloc] initWithValue:7];

        [node14 addChild:node7 withEdgeWeight:3];
        [node14 addChild:node5 withEdgeWeight:6];
        [node14 addChild:node21 withEdgeWeight:5];
        [node7 addChild:node11 withEdgeWeight:3];
        [node5 addChild:node4 withEdgeWeight:9];
        [node5 addChild:node21 withEdgeWeight:3];
        [node11 addChild:node4 withEdgeWeight:3];

        DijkstraGraph *dijkstraGraph = [[DijkstraGraph alloc] init];
        [dijkstraGraph addNode:node14];
        [dijkstraGraph addNode:node7];
        [dijkstraGraph addNode:node5];
        [dijkstraGraph addNode:node21];
        [dijkstraGraph addNode:node11];
        [dijkstraGraph addNode:node4];

        int pathWeight = [dijkstraGraph shortestWeightedPathFrom:node14 to:node4];
        [[@(pathWeight) should] equal:@(9)];
    });
});
SPEC_END

