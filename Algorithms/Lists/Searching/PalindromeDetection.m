//
//  PalindromeDetection.m
//  Algorithms
//
//  Created by Julietta Yaunches on 10/19/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import "PalindromeDetection.h"
#import "LinkedList.h"
#import "LinkedNode.h"

@interface PalindromeDetection ()
@property(nonatomic, strong) LinkedNode *leftNode;
@property(nonatomic) BOOL midNodeHit;
@end

// Palindrome: a word, phrase, number, or other sequence of symbols or elements, whose meaning may be interpreted the
// same way in either forward or reverse direction.
// Linked List Example: 4 -> 2 -> 0 -> 2 -> 4

// This class detects if a given linked list is a palindrome.
@implementation PalindromeDetection

// Algorithm:
// 2 pointer recursive approach
//   -> 1 pointer left on root node
//   -> second pointer recursively move to end until no next node
//   -> upon each return of the recursive call
//      -> check if middle has been reached
//          - YES -> return last result
//          - NO  -> compare the left pointer with the right pointer
//               - YES -> move pointers forward & backward and return true
//               - NO -> return false

// Analysis:
// 1 traversal to move the second pointer to the end, 1/2 traversal moving both pointers toward the middle following this
// O(n)

- (BOOL)isPalindrome:(LinkedList *)list {
    self.midNodeHit = NO;
    self.leftNode = list.rootNode;
    LinkedNode *rightNode = list.rootNode;
    return [self moveThenCompare:rightNode];
}

- (BOOL)moveThenCompare:(LinkedNode *)rightNode {
    if (rightNode.next != nil) {
        BOOL result = [self moveThenCompare:rightNode.next];
        if (!self.midNodeHit && result)
            return [self compareToFirstHalfNodeAndMove:rightNode];
        return result;
    } else {
        return [self compareToFirstHalfNodeAndMove:rightNode];
    }
}

- (BOOL)compareToFirstHalfNodeAndMove:(LinkedNode *)rightNode {
    if (self.leftNode == rightNode) {
        self.midNodeHit = YES;
    }
    if (self.leftNode.data == rightNode.data) {
        self.leftNode = self.leftNode.next;
        return YES;
    } else {
        return NO;
    }
}
    
@end
