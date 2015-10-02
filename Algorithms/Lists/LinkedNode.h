//
//  LinkedNode.h
//  Algorithms
//
//  Created by Julietta Yaunches on 9/16/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LinkedNode : NSObject

@property(nonatomic) int data;

@property(nonatomic, strong) LinkedNode *next;

- (id)initWithData:(int)data withNext:(LinkedNode *)next;
@end
