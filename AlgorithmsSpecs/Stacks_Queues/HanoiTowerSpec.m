//
//  HanoiTowerSpec.m
//  Algorithms
//
//  Created by Julietta Yaunches on 9/28/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "Stack.h"
#import "StackNode.h"
#import "HanoiTower.h"

SPEC_BEGIN(HanoiTowerSpec)
describe(@"HanoiTower", ^{

    it(@"should move 5 disks from tower A to tower B", ^{
        HanoiTower *hanoiTowers = [[HanoiTower alloc] init];

        Tower *towerA = [[Tower alloc] initWithName:@"A"];
        Tower *towerB = [[Tower alloc] initWithName:@"B"];
        Tower *towerC = [[Tower alloc] initWithName:@"C"];
        for (int i = 5; i > 0; i--) {
            [towerA push:@(i)];
        }

        [[@([towerC count]) should] equal:@(0)];
        [hanoiTowers transferDisks:5 from:towerA to:towerC buffer:towerB];
        [[@([towerC count]) should] equal:@(5)];
    });
    
});
SPEC_END