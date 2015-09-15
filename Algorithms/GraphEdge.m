//
//  GraphEdge.m
//  Algorithms
//
//  Created by Julietta Yaunches on 9/14/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import "GraphEdge.h"

@interface GraphEdge ()
@end

@implementation GraphEdge

- (id)initWithIncoming:(int)incoming andDestination:(int)destination {
    self = [super init];
    self.incoming = incoming;
    self.destination = destination;
    return self;
}
@end
