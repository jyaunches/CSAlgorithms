//
//  GraphSortingSpec.m
//  Algorithms
//
//  Created by Julietta Yaunches on 9/14/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "GraphEdge.h"
#import "GraphSort.h"

SPEC_BEGIN(TopologicalSortSpec)
describe(@"TopologicalSort", ^{
    //Find an order in which the following classes can be taken

    //        142
    //         |
    //        143
    //   /  /  |   \
    // 378 370 341 321
    //  |       |   |  \
    // 401     401 326 322
    //            / |    | \
    //         401 421  401 421

    it(@"should come up with expected order", ^{
        GraphEdge *edge1 = [[GraphEdge alloc] initWithIncoming:0 andDestination:142];
        GraphEdge *edge2 = [[GraphEdge alloc] initWithIncoming:142 andDestination:143];
        GraphEdge *edge3 = [[GraphEdge alloc] initWithIncoming:143 andDestination:378];
        GraphEdge *edge4 = [[GraphEdge alloc] initWithIncoming:143 andDestination:370];
        GraphEdge *edge5 = [[GraphEdge alloc] initWithIncoming:143 andDestination:341];
        GraphEdge *edge6 = [[GraphEdge alloc] initWithIncoming:143 andDestination:321];
        GraphEdge *edge7 = [[GraphEdge alloc] initWithIncoming:378 andDestination:401];
        GraphEdge *edge8 = [[GraphEdge alloc] initWithIncoming:341 andDestination:401];
        GraphEdge *edge9 = [[GraphEdge alloc] initWithIncoming:321 andDestination:326];
        GraphEdge *edge10 = [[GraphEdge alloc] initWithIncoming:321 andDestination:322];
        GraphEdge *edge11 = [[GraphEdge alloc] initWithIncoming:326 andDestination:401];
        GraphEdge *edge12 = [[GraphEdge alloc] initWithIncoming:326 andDestination:421];
        GraphEdge *edge13 = [[GraphEdge alloc] initWithIncoming:322 andDestination:401];
        GraphEdge *edge14 = [[GraphEdge alloc] initWithIncoming:322 andDestination:421];

        NSArray *edges = @[edge12, edge6, edge4, edge1, edge3, edge2,
                edge5, edge7, edge8, edge10, edge9, edge11, edge13, edge14];
        GraphSort *graphSort = [[GraphSort alloc] init];

        NSArray *result = [graphSort topologicalSort:edges];
        NSNumber *first = result[0];

        [[first should ] equal:@(142)];

    });


});

SPEC_END