//
//  HanoiTower.h
//  Algorithms
//
//  Created by Julietta Yaunches on 9/28/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tower.h"

@interface HanoiTower : NSObject
- (void)transferDisks:(int)numberOfDisks from:(Tower *)origin to:(Tower *)destination buffer:(Tower *)buffer;
@end
