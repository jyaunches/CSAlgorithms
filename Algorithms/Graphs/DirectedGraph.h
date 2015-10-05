//
//  DirectedGraph.h
//  Algorithms
//
//  Created by Julietta Yaunches on 10/5/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GraphNode.h"

@interface DirectedGraph : NSObject

+ (BOOL)routeExistsFrom:(GraphNode *)node1 to:(GraphNode *)node2;
@end
