//
//  StackSpec.m
//  Algorithms
//
//  Created by Julietta Yaunches on 9/25/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "Stack.h"
#import "StackNode.h"
#import "MinStackNode.h"

SPEC_BEGIN(StackSpec)
        describe(@"Stack", ^{
            it(@"should be able to push", ^{
                Stack *stack = [[Stack alloc] init];

                [stack push:@(1)];
                [stack push:@(2)];

                NSNumber *top = [stack pop];
                [[top should] equal:@(2)];
            });

            it(@"should determine minimum element", ^{
                Stack *stack = [[Stack alloc] init];
                [stack push:@(5)];
                [stack push:@(2)];
                [stack push:@(7)];

                NSNumber *min = [stack.currentMin value];
                [[min should] equal:@(2)];

                [stack push:@(1)];
                [stack push:@(9)];

                min = [stack.currentMin value];
                [[min should] equal:@(1)];

            });
        });
SPEC_END
