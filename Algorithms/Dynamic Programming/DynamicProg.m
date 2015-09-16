#import <ObjectiveSugar/ObjectiveSugar.h>
#import "DynamicProg.h"


@implementation DynamicProg


// O(n) complexity
+ (NSArray *)find:(NSArray *)coins forSum:(NSNumber *)sum {
    __block NSMutableDictionary *subSums = [NSMutableDictionary dictionary];

    [@(sum.intValue + 1) timesWithIndex:^(NSUInteger currentSum) {
        [coins each:^(NSNumber *coinValue) {
            if (coinValue.intValue == currentSum) {
                subSums[@(currentSum)] = @[coinValue];
            } else if (coinValue.intValue < currentSum) {
                int difference = currentSum - coinValue.intValue;
                NSArray *calcSubSumForDiff = subSums[@(difference)];
                if (calcSubSumForDiff.count > 0) {
                    subSums[@(currentSum)] = [calcSubSumForDiff arrayByAddingObject:coinValue];
                }
            }
        }];
    }];

    return subSums[sum];
}

//5, 3, 4, 8, 6, 7
+ (NSNumber *)findLengthOfNonDecreasingSequence:(NSArray *)sequence {
    __block int knownMaxLength = 0;

    __block int lastEvaluated = 0;
    __block int currentSeqLength = 0;

    [sequence each:^(NSNumber *item) {
        if (item.intValue > lastEvaluated) {
            currentSeqLength += 1;
        } else {
            currentSeqLength = 1;
        }
        lastEvaluated = item.intValue;

        if (currentSeqLength > knownMaxLength) {
            knownMaxLength = currentSeqLength;
        }
    }];

    return @(knownMaxLength);
}

+ (NSNumber *)shortestPathFrom:(NSNumber *)start to:(NSNumber *)finish inGraphWithEdges:(NSArray *)edges {

    NSMutableDictionary *visitedNodes = [NSMutableDictionary dictionary];

    //find origin edge
    NSArray *originEdge = [edges find:^BOOL(NSArray *edge) {
        return [edge[0] isEqualToNumber:start] || [edge[1] isEqualToNumber:start];
    }];

    //mark origin node and neighbor node as visited w/ distance from origin
    NSNumber *originEdge1 = originEdge[0];
    NSNumber *originEdge2 = originEdge[1];

    if ([originEdge1 isEqualToNumber:start]) {
        visitedNodes[originEdge1] = @(0);
        visitedNodes[originEdge2] = @(1);
    } else if ([originEdge2 isEqualToNumber:start]) {
        visitedNodes[originEdge1] = @(1);
        visitedNodes[originEdge2] = @(0);
    }

    //Remove origin edge from edges remaining to search
    NSMutableArray *remainingEdges = [edges mutableCopy];
    [remainingEdges removeObject:originEdge];

    while (remainingEdges.count > 0) {
        //visit edges that contain an already visited node only.. so distance from origin can be calculated
        [remainingEdges each:^(NSArray *edge) {
            NSNumber *edge1 = edge[0];
            NSNumber *edge2 = edge[1];
            if ([visitedNodes hasKey:edge1] && ![visitedNodes hasKey:edge2]) {
                NSNumber *knownNode = visitedNodes[edge1];
                visitedNodes[edge2] = @(knownNode.intValue + 1);
                [remainingEdges removeObject:edge];
            } else if ([visitedNodes hasKey:edge2] && ![visitedNodes hasKey:edge1]) {
                NSNumber *knownNode = visitedNodes[edge2];
                visitedNodes[edge1] = @(knownNode.intValue + 1);
                [remainingEdges removeObject:edge];
            } else {
                [remainingEdges removeObject:edge];
            }
        }];
    }

    return visitedNodes[finish];
}

// my original version
//+ (NSNumber *)findZigZagLength:(NSMutableArray *)inputSequence {
//    NSMutableArray *zigZagSequence = [NSMutableArray array];
//    NSNumber *firstNumber = [inputSequence shift];
//    NSNumber *secondNumber = [inputSequence shift];
//    [zigZagSequence addObject:firstNumber];
//    [zigZagSequence addObject:secondNumber];
//
//    __block int startingDiff = secondNumber.intValue - firstNumber.intValue;
//
//    [inputSequence each:^(NSNumber *current) {
//        NSUInteger zigZagLength = zigZagSequence.count;
//        NSNumber *last = zigZagSequence[zigZagLength-1];
//
//        if((current.intValue - last.intValue) != 0){
//            int nextDiff = current.intValue - last.intValue;
//            if(nextDiff * startingDiff < 0){
//                [zigZagSequence addObject:current];
//                startingDiff = startingDiff * -1;
//            }
//        }
//    }];
//
//    return @(zigZagSequence.count);
//}

+ (NSNumber *)findZigZagLength:(NSMutableArray *)sequence {
    if(sequence.count == 1) return @(1);

    NSMutableDictionary *result = [NSMutableDictionary dictionary];

    for(int index =1; index <sequence.count; index++)
    {
        NSNumber *currentItem = sequence[index];
        NSNumber *lastItem = sequence[index-1];

        result[@(index -1)] = @(currentItem.intValue - lastItem.intValue);
    }

    int locationOfFirstNonZero =0;
    while(locationOfFirstNonZero < result.count && [result[@(locationOfFirstNonZero)] isEqualToNumber:@(0)])
        locationOfFirstNonZero++;
    if(locationOfFirstNonZero == result.count) return @(1);

    NSNumber *numberToCompareToNext = result[@(locationOfFirstNonZero)];
    int len = 2;

    int remainingDiffsInSequence = locationOfFirstNonZero +1;
    for(int i=remainingDiffsInSequence;i<result.count;i++)
    {
        NSNumber *nextDiff = result[@(i)];
        if(nextDiff.intValue * numberToCompareToNext.intValue < 0)
        {
            numberToCompareToNext = @(numberToCompareToNext.intValue * -1);
            len++;
        }
    }
    return @(len);
}
@end