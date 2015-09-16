//
//  GraphNode.m
//  Algorithms
//
//  Created by Julietta Yaunches on 9/14/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import "GraphNode.h"

@interface GraphNode ()
@end

@implementation GraphNode

- (id)initWithValue:(int)value {
    self = [super init];
    self.value = value;
    return self;
}
@end
