//
// Created by Julietta Yaunches on 10/19/15.
// Copyright (c) 2015 yaunches. All rights reserved.
//

#import <ObjectiveSugar/NSArray+ObjectiveSugar.h>
#import "NSMutableArray+BinaryTreeNode.h"
#import "BinaryTreeNode.h"


@implementation NSMutableArray (BinaryTreeNode)
- (int)sumNodesInRange:(NSRange)range {
    __block int potentialSum = 0;
    [[self subarrayWithRange:range] each:^(BinaryTreeNode *subNode) {
        potentialSum += subNode.value;
    }];

    return potentialSum;
}
@end