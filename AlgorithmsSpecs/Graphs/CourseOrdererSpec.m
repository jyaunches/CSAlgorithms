//
//  GraphSortingSpec.m
//  Algorithms
//
//  Created by Julietta Yaunches on 9/14/15.
//  Copyright (c) 2015 yaunches. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import <ObjectiveSugar/NSArray+ObjectiveSugar.h>
#import "CourseOrderer.h"
#import "GraphNode.h"

SPEC_BEGIN(CourseOrdererSpec)
describe(@"CourseOrderer", ^{
    // University courses often have prerequisites that must be completed before
    // a student can register for the course.

    // The following tree represents this situation where a parent node is course that
    // must be attended before subsequent child node courses.

    // Find an order in which the following classes can be taken
    //        142
    //         |
    //        143
    //   /  /  |   \
    // 378 370 341 321
    //  |       |   |  \
    // 401     401 326 322
    //            / |    | \
    //         401 421  401 421

    it(@"should order so that dependencies are intact", ^{
        GraphNode *course142 = [[GraphNode alloc] initWithValue:142];
        GraphNode *course143 = [[GraphNode alloc] initWithValue:143];
        GraphNode *course378 = [[GraphNode alloc] initWithValue:378];
        GraphNode *course370 = [[GraphNode alloc] initWithValue:370];
        GraphNode *course341 = [[GraphNode alloc] initWithValue:341];
        GraphNode *course321 = [[GraphNode alloc] initWithValue:321];
        GraphNode *course401 = [[GraphNode alloc] initWithValue:401];
        GraphNode *course326 = [[GraphNode alloc] initWithValue:326];
        GraphNode *course322 = [[GraphNode alloc] initWithValue:322];
        GraphNode *course421 = [[GraphNode alloc] initWithValue:421];

        [course142 addEdges:@[course143]];
        [course143 addEdges:@[course378, course370, course341, course321]];
        [course378 addEdges:@[course401]];
        [course341 addEdges:@[course401]];
        [course321 addEdges:@[course326, course322]];
        [course326 addEdges:@[course401, course421]];
        [course322 addEdges:@[course401, course421]];

        NSArray *departmentCourses = @[course321, course326, course322, course142, course143,
                                        course341, course401, course421, course378, course370];

        CourseOrderer *graphSort = [[CourseOrderer alloc] init];

        NSArray *result = [graphSort sortCourses:departmentCourses];

        [[@(result.count) should] equal:@(10)];

        __block int lastCourseNumber = 0;
        [result each:^(GraphNode *course) {
            NSLog(@"Course: %i", course.value);
        }];
    });


});

SPEC_END