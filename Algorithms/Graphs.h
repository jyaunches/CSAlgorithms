//
//  Graphs.h
//  Algorithms
//
//  Created by Julietta Yaunches on 9/14/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GraphNode;

@interface Graphs : NSObject
- (int)breadthFirstSearch:(GraphNode *)root targetValue:(int)target;
@end
