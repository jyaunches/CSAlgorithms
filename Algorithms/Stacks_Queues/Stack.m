//
//  Stack.m
//  Algorithms
//
//  Created by Julietta Yaunches on 9/25/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import "Stack.h"
#import "StackNode.h"
#import "NSNumber+Helpers.h"
#import "MinStackNode.h"

@implementation Stack

- (void)push:(NSNumber *)value {
    StackNode *newTop;
    if(!self.currentMin || [value isLessThan:self.currentMin.value]){
        newTop = [[MinStackNode alloc] initWithValue:value andLastMin:self.currentMin];
        self.currentMin = (MinStackNode*)newTop;
    }else{
        newTop = [[StackNode alloc] initWithValue:value];
    }
    
    newTop.next = self.topNode;
    self.topNode = newTop;
}

- (NSNumber *)pop {
    StackNode *toReturn = self.topNode;
    if([toReturn isKindOfClass:[MinStackNode class]] && [toReturn.value isEqualToNumber:self.currentMin.value]){
        self.currentMin = [((MinStackNode *)toReturn) lastMin];
    }
    self.topNode = toReturn.next;
    return toReturn.value;
}

- (int)count {
    int result = 0;
    StackNode *countNode = self.topNode;
    while(countNode != nil){
        countNode = countNode.next;
        result++;
    }

    return result;
}

@end
