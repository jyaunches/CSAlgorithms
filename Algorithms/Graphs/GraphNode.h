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

@property(nonatomic) int value;

- (void)addEdges:(NSArray *)children;

@property(nonatomic, strong) NSMutableArray *children;

- (void)removeIncoming:(GraphNode *)node;

@property(nonatomic) BOOL visited;

@property(nonatomic) int distanceFromRoot;
@property(nonatomic, strong) NSMutableArray *incoming;
@end
