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

// Notes:
// - graph can be binary or non-binary
// - graph can be is directed or undirected (visited flag takes care of redundant checks)

// Asymptotic Analysis:
// Best case: O(1) <- we find our target at the root
// Worse case: O(E) <- Where E is the number of edges and we find our target on the last edge searched

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
                [searchStack addObjectsFromArray:nextNode.children];
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
