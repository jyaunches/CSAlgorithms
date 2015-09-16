//
//  NSArray+Helpers.m
//  Algorithms
//
//  Created by Julietta Yaunches on 9/15/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <ObjectiveSugar/NSArray+ObjectiveSugar.h>
#import "NSArray+Helpers.h"

@implementation NSArray (Helpers)

- (BOOL)isEmpty {
    return self.count == 0;
}

- (int)firstNumber {
    return ((NSNumber *)[self firstObject]).intValue;
}
@end
