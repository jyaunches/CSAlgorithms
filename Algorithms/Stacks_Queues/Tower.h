//
//  Tower.h
//  Algorithms
//
//  Created by Julietta Yaunches on 9/28/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Stack.h"

@interface Tower : Stack
@property(nonatomic, copy) NSString *name;

- (id)initWithName:(NSString *)string;
@end
