//
//  BadNeighbors.m
//  Algorithms
//
//  Created by Julietta Yaunches on 9/15/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <ObjectiveSugar/NSDictionary+ObjectiveSugar.h>
#import "BadNeighbors.h"

@interface BadNeighbors ()
@property(nonatomic, strong) NSArray *allDonations;
@property(nonatomic, strong) NSMutableDictionary *donationDictionary;
@end

@implementation BadNeighbors

//+ (NSNumber *)findHighest:(NSArray *)allDonations {
//
//    NSMutableArray *evenDonations = [NSMutableArray array];
//    int evenTotal = 0;
//    NSMutableArray *oddDonations = [NSMutableArray array];
//    int oddTotal = 0;
//
//
//    for(int evenIndex=0; evenIndex < allDonations.count; evenIndex +=2){
//        NSNumber *donation = allDonations[evenIndex];
//        [evenDonations addObject:donation];
//        evenTotal += donation.intValue;
//    }
//
//    for(int oddIndex=1; oddIndex < allDonations.count; oddIndex +=2){
//        NSNumber *donation = allDonations[oddIndex];
//        [oddDonations addObject:donation];
//        oddTotal += donation.intValue;
//    }
//
//    //if total count even, take highest
//    //if odd swap first or last of odd set
//
//    return @(0);
//}

- (NSNumber *)findHighest:(NSArray *)allDonations {
    self.allDonations = allDonations;
    int donationsSize = allDonations.count;
    self.donationDictionary = [NSMutableDictionary dictionary];

    NSNumber *maxEvenDonations = [self getDonationsInRangeWithStartIndex:0 andUpperIndex:donationsSize - 2];
    NSNumber *maxOddDonations = [self getDonationsInRangeWithStartIndex:1 andUpperIndex:donationsSize - 1];
    return MAX(maxEvenDonations, maxOddDonations);
}

- (NSNumber *)getDonationsInRangeWithStartIndex:(int)currentDonationIndex andUpperIndex:(int)lastDonationIndex {
    int arbitraryIndexOffset = 300;
    int storedSumKey = currentDonationIndex + arbitraryIndexOffset + lastDonationIndex;

    if([self.donationDictionary hasKey:@(storedSumKey)]){
        return self.donationDictionary[@(storedSumKey)];
    }

    if(currentDonationIndex > lastDonationIndex){
        return @(0);
    }

    NSNumber *nextMaxEven = [self getDonationsInRangeWithStartIndex:currentDonationIndex + 1 andUpperIndex:lastDonationIndex];
    NSNumber *nextMaxOdd = [self getDonationsInRangeWithStartIndex:currentDonationIndex + 2 andUpperIndex:lastDonationIndex];

    int currentDonation = ((NSNumber*)self.allDonations[currentDonationIndex]).intValue;
    NSNumber *potentialDonationCombo = @(nextMaxOdd.intValue + currentDonation);

    self.donationDictionary[@(storedSumKey)] = MAX(nextMaxEven, potentialDonationCombo);
    return self.donationDictionary[@(storedSumKey)]; 
}

@end
