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

    it(@"should initialize specified disks onto tower A", ^{
        HanoiTower *hanoiTowers = [[HanoiTower alloc] initWithDisks:3];
        [[@([hanoiTowers.towerA count]) should] equal:@(3)];
        [[@([hanoiTowers.towerB count]) should] equal:@(0)];
        [[@([hanoiTowers.towerC count]) should] equal:@(0)];
    });

    it(@"should move 5 disks from tower A to tower B", ^{
        HanoiTower *hanoiTowers = [[HanoiTower alloc] initWithDisks:5];

        [[@([hanoiTowers.towerC count]) should] equal:@(0)];
        [hanoiTowers transferDisks:5 from:hanoiTowers.towerA to:hanoiTowers.towerC buffer:hanoiTowers.towerB];
        [[@([hanoiTowers.towerC count]) should] equal:@(5)];
    });
    
});
SPEC_END