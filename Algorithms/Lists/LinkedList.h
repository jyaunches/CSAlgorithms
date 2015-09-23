//
//  LinkedList.h
//  Algorithms
//
//  Created by Julietta Yaunches on 9/16/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LinkedNode;

@interface LinkedList : NSObject

@property(nonatomic, strong) LinkedNode *palindromeFirstHalfNode;

@property(nonatomic) BOOL midNodeHit;

- (id)initWithRootNode:(LinkedNode *)node;

- (void)appendOnEnd:(LinkedNode *)node;

- (int)size;

- (LinkedNode *)lastNode;

- (void)deleteNodeWithValue:(int)target;

- (void)removeDuplicates;

- (LinkedNode *)findKthFromEnd:(int)distanceFromEnd;

- (LinkedNode *)find:(NSNumber *)number;

- (void)partition:(NSNumber *)target;

- (BOOL)isPalindrome;

- (BOOL)hasLoop;
@end
