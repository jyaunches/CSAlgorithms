//
//  EquilibriumCalculator.h
//  Algorithms
//
//  Created by Julietta Yaunches on 10/23/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <Foundation/Foundation.h>

static const int NO_EQUILIBRIUM_YET_FOUND = -1;

@interface EquilibriumCalculator : NSObject
- (id)initWithArray:(NSMutableArray *)array;
- (int)findEquilibrium;
@end
