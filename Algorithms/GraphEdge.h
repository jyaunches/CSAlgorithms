//
//  GraphEdge.h
//  Algorithms
//
//  Created by Julietta Yaunches on 9/14/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GraphEdge : NSObject
@property(nonatomic) int destination;
@property(nonatomic) int incoming;

- (id)initWithIncoming:(int)pVoid andDestination:(int)destination;
@end
