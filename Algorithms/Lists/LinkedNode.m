//
//  LinkedNode.m
//  Algorithms
//
//  Created by Julietta Yaunches on 9/16/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import "LinkedNode.h"

@implementation LinkedNode

- (id)initWithData:(int)data withNext:(LinkedNode *)next {
    self = [super init];
    self.data = data;
    self.next = next;
    return self;
}
@end
