//
//  EquilibriumCalculator.m
//  Algorithms
//
//  Created by Julietta Yaunches on 10/23/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import "EquilibriumCalculator.h"

@interface EquilibriumCalculator ()
@property(nonatomic, strong) NSMutableArray *array;
@property(nonatomic) int equilibriumIndex;
@end

@implementation EquilibriumCalculator

- (id)initWithArray:(NSMutableArray *)array {
    self = [super init];
    self.array = array;
    self.equilibriumIndex = NO_EQUILIBRIUM_YET_FOUND;
    return self;
}

- (int)findEquilibrium {
    if(self.array.count == 0){
        return NO_EQUILIBRIUM_YET_FOUND;
    }
    long sumBehind = 0;
    int startIndex = 0;
    [self findEquilibriumGivenBehindSum:sumBehind andIndex:startIndex];

    return self.equilibriumIndex;
}

- (long)findEquilibriumGivenBehindSum:(long)sumBehind andIndex:(int)index {
    if (index == self.array.count) {
        return 0;
    } else {
        NSNumber *curValue = (NSNumber *) self.array[index];
        long sumBehindForNext = sumBehind + curValue.longValue;
        int nextIndex = index + 1;
        long sumAhead = [self findEquilibriumGivenBehindSum:sumBehindForNext andIndex:nextIndex];

        [self assignEquilibrium:sumBehind index:index sumAhead:sumAhead];
        return curValue.intValue + sumAhead;
    }
}

- (void)assignEquilibrium:(long)sumBehind index:(int)index sumAhead:(long)sumAhead {
    if ((sumAhead == sumBehind) && (self.equilibriumIndex == NO_EQUILIBRIUM_YET_FOUND)) {
        self.equilibriumIndex = index;
    }
}
@end
