//
//  DepthFirstSearch.m
//  Algorithms
//
//  Created by Julietta Yaunches on 9/14/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <ObjectiveSugar/NSMutableArray+ObjectiveSugar.h>
#import "DepthFirstSearch.h"
#import "NSMutableArray+QueueHelper.h"


@interface DepthFirstSearch ()
@property(nonatomic) int visitedNodes;
@property(nonatomic) int target;
@end

@implementation DepthFirstSearch

- (int)countVisitedNodes:(GraphNode *)root forTarget:(int)target {
    if(!root)
        return 0;
    
    self.visitedNodes = 0;
    self.target = target;

    NSMutableArray *searchStack = [@[root] mutableCopy];

    while(searchStack.count > 0){
        GraphNode *nextNode = [searchStack pop];
        if(!nextNode.visited){
            if([self visit:nextNode]){
                return self.visitedNodes;
            }else{
                [searchStack addObjectsFromArray:nextNode.adjacentEdges];
            }
        }
    }

    return self.visitedNodes;
}

- (BOOL)visit:(GraphNode *)node {
    node.visited = YES;
    self.visitedNodes +=1;
    return node.value == self.target;
}
@end
