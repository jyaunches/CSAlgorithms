//
//  DirectedGraphSpec.m
//  Algorithms
//
//  Created by Julietta Yaunches on 10/5/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "GraphNode.h"
#import "BreadthFirstSearch.h"
#import "DepthFirstSearch.h"
#import "DirectedGraph.h"

SPEC_BEGIN(DirectedGraphSpec)
        describe(@"DirectedGraph", ^{
            describe(@"Route determination", ^{
                __block GraphNode *node3;
                __block GraphNode *node9;
                __block GraphNode *node5;
                __block GraphNode *node2;

                //        3
                //    / / | \
                //   5 7 11 15
                //    / \
                //   2   9
                //     / | \
                //    8  3  15
                beforeEach(^{
                    node3 = [[GraphNode alloc] initWithValue:3];
                    node2 = [[GraphNode alloc] initWithValue:2];
                    node5 = [[GraphNode alloc] initWithValue:5];
                    GraphNode *node7 = [[GraphNode alloc] initWithValue:7];
                    GraphNode *node8 = [[GraphNode alloc] initWithValue:8];
                    node9 = [[GraphNode alloc] initWithValue:9];
                    GraphNode *node11 = [[GraphNode alloc] initWithValue:11];
                    GraphNode *node15 = [[GraphNode alloc] initWithValue:15];

                    node3.adjacentEdges = @[node5, node7, node11, node15];
                    node7.adjacentEdges = @[node2, node9];
                    node9.adjacentEdges = @[node8, node3, node15];
                });

                it(@"should determine if there is route between two nodes", ^{
                    BOOL routeExists = [DirectedGraph routeExistsFrom:node3 to:node9];
                    [[@(routeExists) should] beTrue];
                });

                it(@"should determine if there is not a route between two nodes", ^{
                    BOOL routeExists = [DirectedGraph routeExistsFrom:node5 to:node2];
                    [[@(routeExists) should] beFalse];
                });

                it(@"should determine there is a route when given the same nodes", ^{
                    BOOL routeExists = [DirectedGraph routeExistsFrom:node5 to:node5];
                    [[@(routeExists) should] beTrue];
                });

                it(@"should determine there is not a route when one node is nil", ^{
                    BOOL routeExists = [DirectedGraph routeExistsFrom:nil to:node5];
                    [[@(routeExists) should] beFalse];
                });
            });

        });

SPEC_END