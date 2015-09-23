//
//  LinkedList.m
//  Algorithms
//
//  Created by Julietta Yaunches on 9/16/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import "LinkedList.h"
#import "LinkedNode.h"

@interface LinkedList ()
@property(nonatomic, strong) LinkedNode *rootNode;
@end

@implementation LinkedList

- (id)initWithRootNode:(LinkedNode *)node {
    self = [super init];
    self.rootNode = node;
    return self;
}

- (void)appendOnEnd:(LinkedNode *)node {
    if (!self.rootNode) {
        self.rootNode = node;
    } else {
        LinkedNode *nextNode = self.rootNode.next;

        while (nextNode.next != nil) {
            nextNode = nextNode.next;
        }

        nextNode.next = node;
        node.next = nil;
    }
}

- (int)size {
    int size = 0;
    if (self.rootNode) {
        size++;
        LinkedNode *nextNode = self.rootNode.next;
        while (nextNode != nil) {
            nextNode = nextNode.next;
            size++;
        }
    }
    return size;
}

- (LinkedNode *)lastNode {
    if (self.rootNode) {
        LinkedNode *nextNode = self.rootNode.next;

        while (nextNode.next != nil) {
            nextNode = nextNode.next;
        }

        return nextNode;
    }
    return nil;
}

- (void)deleteNodeWithValue:(int)target {
    if (self.rootNode && self.rootNode.data == target) {
        self.rootNode = self.rootNode.next;
    } else {
        LinkedNode *currentNode = self.rootNode;
        while (currentNode.next != nil) {
            if (currentNode.next.data == target) {
                currentNode.next = currentNode.next.next;
                return;
            } else {
                currentNode = currentNode.next;
            }
        }
    }
}

- (void)removeDuplicates {
    if (self.rootNode && self.rootNode.next) {
        LinkedNode *currentEval = self.rootNode;

        while (currentEval != nil) {
            LinkedNode *dupEval = currentEval;
            while (dupEval != nil) {
                if (currentEval.data == dupEval.next.data) {
                    dupEval.next = dupEval.next.next;
                }
                dupEval = dupEval.next;
            }
            currentEval = currentEval.next;
        }
    }
}

- (LinkedNode *)findKthFromEnd:(int)distanceFromEnd {
    int calc = 0;
    return [self findKthNodeFromEnd:self.rootNode dist:distanceFromEnd currCalc:&calc];
}

- (LinkedNode *)findKthNodeFromEnd:(LinkedNode *)head dist:(int)dist currCalc:(int *)calc {
    if (head == nil) {
        return nil;
    }

    LinkedNode *node = [self findKthNodeFromEnd:head.next dist:dist currCalc:calc];
    *calc += 1;

    if (dist == *calc) {
        return head;
    }

    if (node != nil) {
        return node;
    }

    return nil;

}

- (LinkedNode *)find:(NSNumber *)number {
    if (self.rootNode) {
        LinkedNode *currentEval = self.rootNode;
        while (currentEval != nil) {
            if (currentEval.data == number.intValue) {
                return currentEval;
            }
            currentEval = currentEval.next;
        }
    }
    return nil;
}

- (void)partition:(NSNumber *)target {
    LinkedNode *currentEval = self.rootNode;

    while (currentEval != nil) {
        int currentEvalVal = currentEval.data;
        if (currentEvalVal > target.intValue && (currentEval.next != nil)) {
            LinkedNode *nextForEval = currentEval.next;
            [self appendOnEnd:[[LinkedNode alloc] initWithData:currentEval.data withNext:nil]];
            currentEval.data = nextForEval.data;
            currentEval.next = nextForEval.next;
        } else if (currentEval.next.data <= target.intValue) {
            LinkedNode *newRoot = currentEval.next;
            currentEval.next = currentEval.next.next;
            [self appendOnBeginning:newRoot];
            currentEval = currentEval.next;
        } else {
            currentEval = currentEval.next;
        }
    }

}

- (void)appendOnBeginning:(LinkedNode *)newRoot {
    LinkedNode *tempRoot = self.rootNode;
    self.rootNode = newRoot;
    self.rootNode.next = tempRoot;
}

- (BOOL)isPalindrome {
    self.palindromeFirstHalfNode = self.rootNode;
    LinkedNode *secondHalfNode = self.rootNode;
    return [self compare:secondHalfNode];
}

- (BOOL)compare:(LinkedNode *)secondHalfNode {
    if (secondHalfNode.next != nil) {
        BOOL result = [self compare:secondHalfNode.next];
        if (!self.midNodeHit && result)
            return [self compareToFirstHalfNodeAndMove:secondHalfNode];

        return result;
    } else {
        return [self compareToFirstHalfNodeAndMove:secondHalfNode];
    }
}

- (BOOL)compareToFirstHalfNodeAndMove:(LinkedNode *)secondHalfNode {
    if (self.palindromeFirstHalfNode == secondHalfNode) {
        self.midNodeHit = YES;
    }
    if (secondHalfNode.data == self.palindromeFirstHalfNode.data) {
        self.palindromeFirstHalfNode = self.palindromeFirstHalfNode.next;
        return YES;
    } else {
        return NO;
    }
}
@end
