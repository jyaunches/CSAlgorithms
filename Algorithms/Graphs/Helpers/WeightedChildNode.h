//
//  WeightedChildNode.h
//  Algorithms
//
//  Created by Julietta Yaunches on 10/21/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import "GraphNode.h"

@interface WeightedChildNode : NSObject

@property(nonatomic) int weight;

- (id)initWithNode:(GraphNode *)node andWeight:(int)weight;

- (void)updateWeightFromOriginGivenParent:(GraphNode *)node;
@end
