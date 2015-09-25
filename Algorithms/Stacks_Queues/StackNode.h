//
//  StackNode.h
//  Algorithms
//
//  Created by Julietta Yaunches on 9/25/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface StackNode : NSObject
@property(nonatomic, strong) NSNumber *value;
@property(nonatomic, strong) StackNode *next;


- (id)initWithValue:(NSNumber *)number;
@end
