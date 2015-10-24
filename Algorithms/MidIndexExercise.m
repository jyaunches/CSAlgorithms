//
//  ToptalExercise.m
//  Algorithms
//
//  Created by Julietta Yaunches on 10/23/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import "MidIndexExercise.h"

static const int NO_EQUILIBRIUM_YET_FOUND = -1;

@interface MidIndexExercise ()
@property(nonatomic, strong) NSMutableArray *array;
@property(nonatomic) int equilibriumIndexValue;
@property(nonatomic) int target;
@end

@implementation MidIndexExercise
- (id)initWithArray:(NSMutableArray *)array {
    self = [super init];
    self.array = array;
    self.equilibriumIndexValue = NO_EQUILIBRIUM_YET_FOUND;

    return self;
}

- (int)findFor:(int)target {
    if(self.array.count == 0){
        return NO_EQUILIBRIUM_YET_FOUND;
    }
    self.target = target;
    int foundBehind = 0;
    int startIndex = 0;
    [self findCountOfNoneAheadAndCheckGivenCountBehind:foundBehind andIndex:startIndex];
    return self.equilibriumIndexValue;
}

- (int)findCountOfNoneAheadAndCheckGivenCountBehind:(int)behindCount andIndex:(int)index {
    if (index == self.array.count) {
        return 0;
    }

    NSNumber *curValue = self.array[index];
    BOOL currentValueMatchesTarget = curValue.intValue == self.target;

    int newBehind = currentValueMatchesTarget ? behindCount +1 : behindCount;
    int nonMatchingCountAhead = [self findCountOfNoneAheadAndCheckGivenCountBehind:newBehind andIndex:index + 1];
    int newNoneMatchingAhead = currentValueMatchesTarget ? nonMatchingCountAhead : nonMatchingCountAhead + 1;

    if(self.equilibriumIndexValue == NO_EQUILIBRIUM_YET_FOUND){
        BOOL aheadCriteriaMet = newNoneMatchingAhead == curValue.intValue;
        BOOL behindCriteriaMet = behindCount == curValue.intValue;
        if(aheadCriteriaMet && behindCriteriaMet){
            self.equilibriumIndexValue = index;
        }
    }

    return newNoneMatchingAhead;

}
@end
