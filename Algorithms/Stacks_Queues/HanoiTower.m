//
//  HanoiTower.m
//  Algorithms
//
//  Created by Julietta Yaunches on 9/28/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import "HanoiTower.h"

@implementation HanoiTower

- (void)transferDisks:(int)numberOfDisks from:(Tower *)origin to:(Tower *)destination buffer:(Tower *)buffer {
    if (numberOfDisks > 1) {
        int nextDisks = numberOfDisks - 1;

        [self transferDisks:nextDisks from:origin to:buffer buffer:destination];

        [self transferDisks:1 from:origin to:destination buffer:buffer];

        [self transferDisks:nextDisks from:buffer to:destination buffer:origin];

    } else if (numberOfDisks == 1) {
        NSNumber *number = [origin pop];
        [destination push:number];
    }
}
@end
