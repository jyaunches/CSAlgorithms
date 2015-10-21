//
//  WeightedChildNode.m
//  Algorithms
//
//  Created by Julietta Yaunches on 10/21/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import "WeightedChildNode.h"

@interface WeightedChildNode ()
@property(nonatomic, strong) GraphNode *node;
@end

@implementation WeightedChildNode

- (id)initWithNode:(GraphNode *)node andWeight:(int)weight {
    self = [super init];
    self.node = node;
    self.weight = weight;
    return self;
}

- (void)updateWeightFromOriginGivenParent:(GraphNode *)node {
    int potentialNewWeight = node.weightFromOrigin + self.weight;
    if(potentialNewWeight < self.node.weightFromOrigin){
        self.node.weightFromOrigin = potentialNewWeight;
    }
}
@end
