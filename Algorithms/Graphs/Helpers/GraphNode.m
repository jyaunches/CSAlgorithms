//
//  GraphNode.m
//  Algorithms
//
//  Created by Julietta Yaunches on 9/14/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <ObjectiveSugar/NSArray+ObjectiveSugar.h>
#import <ObjectiveSugar/NSMutableArray+ObjectiveSugar.h>
#import "GraphNode.h"
#import "WeightedChildNode.h"

@interface GraphNode ()
@end

@implementation GraphNode

- (id)initWithValue:(int)value {
    self = [super init];
    self.weightFromOrigin = INT_MAX;
    self.value = value;
    self.incoming = [@[] mutableCopy];
    self.children = [@[] mutableCopy];
    return self;
}

- (void)addEdges:(NSArray *)children {
    self.children = [children mutableCopy];
    [children each:^(GraphNode *child) {
        [child.incoming push:self];
    }];
}

- (void)removeIncoming:(GraphNode *)node {
    [self.incoming removeObject:node];
}

- (void)addChild:(GraphNode *)node withEdgeWeight:(int)weight {
    WeightedChildNode *weightedNode = [[WeightedChildNode alloc] initWithNode:node andWeight:weight];
    [self.children addObject:weightedNode];
}


@end
