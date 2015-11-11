#import <ObjectiveSugar/ObjectiveSugar.h>
#import "DynamicProg.h"

// Various exercises under the concept of Dynamic Programming.
// See DynamicProgSpecs for test cases

@implementation DynamicProg

// Problem: Given a list of N coins, their values (V1, V2, … , VN), and the total sum S. Find the minimum number of coins
// the sum of which is S (we can use as many coins of one type as we want), or report that it’s not possible to
// select coins in such a way that they sum up to S.
// O(n) complexity
+ (NSArray *)find:(NSArray *)coins forSum:(NSNumber *)sum {
    __block NSMutableDictionary *subSums = [NSMutableDictionary dictionary];

    [@(sum.intValue + 1) timesWithIndex:^(NSUInteger currentSum) {
        [coins each:^(NSNumber *coinValue) {
            if (coinValue.intValue == currentSum) {
                subSums[@(currentSum)] = @[coinValue];
            } else if (coinValue.intValue < currentSum) {
                NSUInteger difference = currentSum - coinValue.intValue;
                NSArray *calcSubSumForDiff = subSums[@(difference)];
                if (calcSubSumForDiff.count > 0) {
                    subSums[@(currentSum)] = [calcSubSumForDiff arrayByAddingObject:coinValue];
                }
            }
        }];
    }];

    return subSums[sum];
}

// Problem: Given a sequence of N numbers – A[1] , A[2] , …, A[N] . Find the length of the longest non-decreasing sequence.
// Ex. Input: 5, 3, 4, 8, 6, 7
// Expected Result: 3
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

// Problem: A sequence of numbers is called a zig-zag sequence if the differences between successive numbers strictly
// alternate between positive and negative. The first difference (if one exists) may be either positive or negative.
// A sequence with fewer than two elements is trivially a zig-zag sequence.

// For example, 1,7,4,9,2,5 is a zig-zag sequence because the differences (6,-3,5,-7,3) are alternately positive and
// negative. In contrast, 1,4,7,2,5 and 1,7,4,5,5 are not zig-zag sequences, the first because its first two differences
// are positive and the second because its last difference is zero.

// Given a sequence of integers, sequence, return the length of the longest subsequence of sequence that is a zig-zag
// sequence. A subsequence is obtained by deleting some number of elements (possibly zero) from the original sequence,
// leaving the remaining elements in their original order.

// http://community.topcoder.com/stat?c=problem_statement&pm=1259&rd=4493

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
@end