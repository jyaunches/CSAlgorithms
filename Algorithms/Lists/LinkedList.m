//
//  LinkedList.m
//  Algorithms
//
//  Created by Julietta Yaunches on 9/16/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import "LinkedList.h"
#import "LinkedNode.h"

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

- (BOOL)hasLoop {

    //Detect collision point
    //why collide?:
    //sr = slow runner
    //fr = fast runner
    //when sr at node right before it enters loop:
    //  sr @ n steps
    //  fr @ 2n steps
    //     @ 2n - n == n steps into loop
    //when sr enters loop (with determinate length) each step takes it n+(total steps) along in the loop
    //while fr still moves at n+2*(total steps)
    //so with each step they are either moving 1 step closer (or further away.. depending on perspective) from each other


    //Detect loop start
    //We know total number of steps it took to reach collision, use this
    //Collision happens at (loop-size % n) steps into loop
    //  Why?
    //   We know right before sr enters loop, fr is:
    //      n steps into loop -> or (loop-size % n) steps into loop (loop can be bigger than n) - (let's denote this as N)
    //      (loop size - N) steps from the beginning of the loop

    //Steps to collision = n + (loop-size % n)


    //Collision point is n nodes from the start of the loop!!

    return NO;
}
@end
