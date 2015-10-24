//
//  DijkstraShortestPath.h
//  Algorithms
//
//  Created by Julietta Yaunches on 10/21/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import "GraphNode.h"

@interface DijkstraGraph : GraphNode

- (int)shortestWeightedPathFrom:(GraphNode *)origin to:(GraphNode *)destination;

- (void)addNode:(GraphNode *)node;
@end
