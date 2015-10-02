//
//  GraphSpec.m
//  Algorithms
//
//  Created by Julietta Yaunches on 9/14/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "GraphNode.h"
#import "BreadthFirstSearch.h"
#import "DepthFirstSearch.h"

SPEC_BEGIN(GraphSearchSpec)
        describe(@"GraphSearch", ^{
            __block GraphNode *node3;

            //        3
            //    / / | \
            //   5 7 11 15
            //    / \
            //   2   9
            //     / | \
            //    8  3  15
            beforeEach(^{
                node3 = [[GraphNode alloc] initWithValue:3];
                GraphNode *node2 = [[GraphNode alloc] initWithValue:2];
                GraphNode *node5 = [[GraphNode alloc] initWithValue:5];
                GraphNode *node7 = [[GraphNode alloc] initWithValue:7];
                GraphNode *node8 = [[GraphNode alloc] initWithValue:8];
                GraphNode *node9 = [[GraphNode alloc] initWithValue:9];
                GraphNode *node11 = [[GraphNode alloc] initWithValue:11];
                GraphNode *node15 = [[GraphNode alloc] initWithValue:15];

                node3.adjacentEdges = @[node5, node7, node11, node15];
                node7.adjacentEdges = @[node2, node9];
                node9.adjacentEdges = @[node8, node3, node15];

            });

            describe(@"Depth-first search", ^{
                __block DepthFirstSearch *depthFirstSearch;
                beforeAll(^{
                    depthFirstSearch = [[DepthFirstSearch alloc] init];
                });

                it(@"should have 6 visited nodes to find target node 8 in BFS", ^{
                    int visitedNodes = [depthFirstSearch countVisitedNodes:node3 forTarget:8];
                    [[@(visitedNodes) should] equal:@(6)];
                });

                it(@"should find just one node with no edges", ^{
                    int visitedNodes = [depthFirstSearch countVisitedNodes:[[GraphNode alloc] initWithValue:22] forTarget:22];
                    [[@(visitedNodes) should] equal:@(1)];
                });

                it(@"should return total number of nodes visited if result can't be found", ^{
                    int visitedNodes = [depthFirstSearch countVisitedNodes:node3 forTarget:22];
                    [[@(visitedNodes) should] equal:@(8)];
                });

                it(@"should handle nil root", ^{
                    int visitedNodes = [depthFirstSearch countVisitedNodes:nil forTarget:22];
                    [[@(visitedNodes) should] equal:@(0)];
                });
            });


            describe(@"Breadth-first search", ^{
                __block BreadthFirstSearch *breadthFirstSearch;
                beforeAll(^{
                    breadthFirstSearch = [[BreadthFirstSearch alloc] init];
                });

                it(@"should have 6 visited nodes to find target node 9 in BFS", ^{
                    int visitedNodes = [breadthFirstSearch countVisitedNodes:node3 forTarget:9];
                    [[@(visitedNodes) should] equal:@(6)];
                });

                it(@"should have 3 visited nodes to find target node 11 in BFS", ^{
                    int visitedNodes = [breadthFirstSearch countVisitedNodes:node3 forTarget:11];
                    [[@(visitedNodes) should] equal:@(3)];
                });

                it(@"should have 8 visited nodes to find target node 8 in BFS", ^{
                    int visitedNodes = [breadthFirstSearch countVisitedNodes:node3 forTarget:11];
                    [[@(visitedNodes) should] equal:@(3)];
                });

                it(@"should calculate distance between two nodes", ^{
                    int distance = [breadthFirstSearch calculateDistanceFrom:node3 forTarget:8];
                    [[@(distance) should] equal:@(3)];
                });

            });

        });

SPEC_END