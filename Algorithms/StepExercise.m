//
//  ToptalExercise.m
//  Algorithms
//
//  Created by Julietta Yaunches on 10/23/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <ObjectiveSugar/NSArray+ObjectiveSugar.h>
#import "StepExercise.h"

@interface CoordinateHistory : NSObject

- (id)initWithLastHistory:(CoordinateHistory *)history move:(NSArray *)move andStep:(NSUInteger)step;
@property(nonatomic) int xCoor;
@property(nonatomic) int yCoor;
@property(nonatomic) NSUInteger step;

@end

@implementation CoordinateHistory

- (id)initWithLastHistory:(CoordinateHistory *)history move:(NSArray *)move andStep:(NSUInteger)step {
    self = [super init];
    if(!history){
        self.xCoor = ((NSNumber*)move[0]).intValue;
        self.yCoor = ((NSNumber*)move[1]).intValue;
    }else{
        self.xCoor = history.xCoor + ((NSNumber*)move[0]).intValue;
        self.yCoor = history.yCoor + ((NSNumber*)move[1]).intValue;
    }
    self.step = step +1;
    
    return self;
}
@end


@interface StepExercise ()
@property(nonatomic, strong) NSMutableArray *array;
@property(nonatomic) int target;
@property(nonatomic, strong) NSMutableArray *moveHistory;
@end

@implementation StepExercise

- (id)initWithMoves:(NSMutableArray *)array {
    self = [super init];
    self.array = array;
    self.moveHistory = [[NSMutableArray alloc] init];
    CoordinateHistory *lastHistory = nil;
    for(NSArray *move in self.array){
        CoordinateHistory *thisMove = [[CoordinateHistory alloc] initWithLastHistory:lastHistory move:move andStep:[self.array indexOfObject:move]];
        [self.moveHistory addObject:thisMove];
        lastHistory = thisMove;       
    }
    return self;
}

- (int)findFor:(NSArray *)location {
    CoordinateHistory *firstStepAtLocation = [self.moveHistory find:^BOOL(CoordinateHistory *coordinateHistory) {
        return (coordinateHistory.xCoor == ((NSNumber*)location[0]).intValue &&
                coordinateHistory.yCoor == ((NSNumber*)location[1]).intValue);        
    }];

    return firstStepAtLocation.step;
}

@end
