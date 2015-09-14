//
//  GraphNode.h
//  Algorithms
//
//  Created by Julietta Yaunches on 9/14/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GraphNode : NSObject
@property(nonatomic) int value;
@property(nonatomic, strong) NSArray *adjacentEdges;

@property(nonatomic) BOOL visited;

- (id)initWithValue:(int)value;
@end
