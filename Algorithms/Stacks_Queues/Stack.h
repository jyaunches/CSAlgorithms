//
//  Stack.h
//  Algorithms
//
//  Created by Julietta Yaunches on 9/25/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <Foundation/Foundation.h>

@class StackNode;
@class MinStackNode;

@interface Stack : NSObject
@property(nonatomic, strong) StackNode *topNode;
@property(nonatomic, strong) MinStackNode *currentMin;

- (void)push:(NSNumber *)value;
- (NSNumber *)pop;

@end
