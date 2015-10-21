//
//  GraphNode.h
//  Algorithms
//
//  Created by Julietta Yaunches on 9/14/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GraphNode : NSObject
- (id)initWithValue:(int)value;
- (void)addEdges:(NSArray *)children;
- (void)removeIncoming:(GraphNode *)node;
- (void)addChild:(GraphNode *)node withEdgeWeight:(int)weight;

@property(nonatomic) int value;
@property(nonatomic, strong) NSMutableArray *children;
@property(nonatomic) BOOL visited;
@property(nonatomic) int distanceFromOrigin;
@property(nonatomic, strong) NSMutableArray *incoming;

@property(nonatomic) int weightFromOrigin;
@end
