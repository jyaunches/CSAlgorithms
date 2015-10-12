//
//  BinaryTreePathValueFinder.m
//  Algorithms
//
//  Created by Julietta Yaunches on 10/6/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <ObjectiveSugar/NSMutableArray+ObjectiveSugar.h>
#import <ObjectiveSugar/NSArray+ObjectiveSugar.h>
#import "BinaryTreePathValueFinder.h"
#import "BinaryTreeNode.h"

@interface BinaryTreePathValueFinder ()
@property(nonatomic, strong) BinaryTreeNode *root;
@property(nonatomic, strong) NSMutableArray *evalQueue;
@property(nonatomic, strong) NSMutableArray *results;
@end

@implementation BinaryTreePathValueFinder

- (id)initWithRoot:(BinaryTreeNode *)node {
    self = [super init];
    self.root = node;
    self.evalQueue = [@[] mutableCopy];
    return self;
}

- (NSArray *)evaluateForTarget:(int)target {
    if(!self.root)
        return self.evalQueue;

    [self.evalQueue push:self.root];
    self.results = [@[] mutableCopy]; 

    NSRange startingRange = NSMakeRange(0, 0);
    [self evalNode:self.root forTarget:target withRange:startingRange];

    return self.results;
}

- (void)evalNode:(BinaryTreeNode *)node forTarget:(int)target withRange:(NSRange)range {
    if(!node)
        return;

    range.length = range.length+1;
    [self.evalQueue insertObject:node atIndex:0];

    __block BOOL endSearch = NO;
    while(!endSearch && range.length > 0){
        __block int potentialSum = 0;
        [[self.evalQueue subarrayWithRange:range] each:^(BinaryTreeNode *subNode) {
            potentialSum += subNode.value;
        }];

        if(potentialSum > target){
            range.length = range.length-1;
        }else if(potentialSum == target){
            endSearch = YES;
            [self.results push:@"result found"];
        } else{
            endSearch = YES;
        }
    }

    [self evalNode:node.left forTarget:target withRange:range];
    [self evalNode:node.right forTarget:target withRange:range];

    [self.evalQueue shift];
}
@end
