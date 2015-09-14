//
//  GraphSpec.m
//  Algorithms
//
//  Created by Julietta Yaunches on 9/14/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "GraphNode.h"
#import "Graphs.h"

SPEC_BEGIN(GraphsSpec)
describe(@"Graphs", ^{

    describe(@"Breadth-first search", ^{
        __block Graphs *graphs;
        __block GraphNode *root;

        //        3
        //    / / | \
        //   5 7 11 15
        //    / \
        //   2   9
        beforeEach(^{
            root = [[GraphNode alloc] initWithValue:3];
            GraphNode *nestedNode = [[GraphNode alloc] initWithValue:7];
            nestedNode.adjacentEdges = @[
                    [[GraphNode alloc] initWithValue:2],
                    [[GraphNode alloc] initWithValue:9]
            ];
            root.adjacentEdges = @[
                    [[GraphNode alloc] initWithValue:5],
                    nestedNode,
                    [[GraphNode alloc] initWithValue:11],
                    [[GraphNode alloc] initWithValue:15]
            ];

            graphs = [[Graphs alloc] init];
        });

        it(@"should have 6 visited nodes to find target node 9 in BFS", ^{
            int visitedNodes = [graphs breadthFirstSearch:root targetValue:9];
            [[@(visitedNodes) should] equal:@(6)];
        });

        it(@"should have 3 visited nodes to find target node 11 in BFS", ^{
            int visitedNodes = [graphs breadthFirstSearch:root targetValue:11];
            [[@(visitedNodes) should] equal:@(3)];
        });

    });
    
});

SPEC_END