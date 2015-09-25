//
//  StackNode.m
//  Algorithms
//
//  Created by Julietta Yaunches on 9/25/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import "StackNode.h"
#import "MinStackNode.h"

@interface StackNode ()
@end

@implementation StackNode

- (id)initWithValue:(NSNumber *)number {
    self = [super init];
    self.value = number;
    return self;
}
@end
