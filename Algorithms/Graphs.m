//
//  Graphs.m
//  Algorithms
//
//  Created by Julietta Yaunches on 9/14/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <ObjectiveSugar/NSArray+ObjectiveSugar.h>
#import <ObjectiveSugar/NSMutableArray+ObjectiveSugar.h>
#import "Graphs.h"
#import "GraphNode.h"
#import "NSMutableArray+QueueHelper.h"

@interface Graphs ()
@property(nonatomic) int visitedNodes;
@property(nonatomic) int target;
@end

@implementation Graphs

- (int)breadthFirstSearch:(GraphNode *)root targetValue:(int)target {
    self.visitedNodes = 0;
    self.target = target;
    
    NSMutableArray *searchQueue = [@[root] mutableCopy];
    
    while(searchQueue.count > 0){
        GraphNode *nextNode = [searchQueue pop];   
        if(!nextNode.visited){
            if([self visit:nextNode]){
                return self.visitedNodes;
            }else{
                [searchQueue pushObjects:nextNode.adjacentEdges];
            }
        }
    }
    
    return 0;
}

- (BOOL)visit:(GraphNode *)node {
    node.visited = YES;
    self.visitedNodes +=1;
    return node.value == self.target;
}
@end
