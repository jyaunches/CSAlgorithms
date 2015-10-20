//
//  ShortestPathSpec.m
//  Algorithms
//
//  Created by Julietta Yaunches on 10/20/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "GraphNode.h"
#import "DirectedGraph.h"

SPEC_BEGIN(ShortestPathSpec)
        describe(@"ShortestPath", ^{
            __block GraphNode *node3;
            __block GraphNode *node8;
            __block GraphNode *node4;

            // Example Graph
            //        3
            //    / / | \
            //   5 7 11 15
            //    / \
            //   2   15
            //  /   / | \
            // 4   8  3  9

            beforeEach(^{
                node3 = [[GraphNode alloc] initWithValue:3];
                GraphNode *node5 = [[GraphNode alloc] initWithValue:5];
                GraphNode *node7 = [[GraphNode alloc] initWithValue:7];
                GraphNode *node11 = [[GraphNode alloc] initWithValue:11];
                GraphNode *node15 = [[GraphNode alloc] initWithValue:15];
                GraphNode *node2 = [[GraphNode alloc] initWithValue:2];
                node4 = [[GraphNode alloc] initWithValue:4];
                node8 = [[GraphNode alloc] initWithValue:8];
                GraphNode *node9 = [[GraphNode alloc] initWithValue:9];

                node3.children = [@[node5, node7, node11, node15] mutableCopy];
                node7.children = [@[node2, node15] mutableCopy];
                node15.children = [@[node8, node3, node9] mutableCopy];
                node2.children = [@[node4] mutableCopy];

            });
            
            it(@"should find shortest path between 3 and 8 as 15-8, 2", ^{
                NSNumber *shortestPath = [DirectedGraph shortestPathFrom:node3 to:node8];
                [[shortestPath should] equal:@(2)];
            });

            it(@"should find shortest path between 3 and 4 as 7-2-4, 3", ^{
                NSNumber *shortestPath = [DirectedGraph shortestPathFrom:node3 to:node4];
                [[shortestPath should] equal:@(3)];
            });

            it(@"should return nil if destination not found", ^{
                GraphNode *node44 = [[GraphNode alloc] initWithValue:44];
                NSNumber *shortestPath = [DirectedGraph shortestPathFrom:node3 to:node44];
                [[shortestPath should] beNil];
            });

        });

SPEC_END