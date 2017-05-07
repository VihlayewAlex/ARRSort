//
//  TimeMeasurer.m
//  ARRSort
//
//  Created by Alex Vihlayew on 4/9/17.
//  Copyright © 2017 Alex. All rights reserved.
//

#import "TimeMeasurer.h"

@interface TimeMeasurer()

@property (strong, nonatomic) NSDate* lastDate;

@end

@implementation TimeMeasurer

- (void) startCounting {
    [self setLastDate:[[NSDate alloc] init]];
}

- (NSTimeInterval) getTimeInterval {
    NSDate* currentDate = [[NSDate alloc] init];
    return [currentDate timeIntervalSinceDate:_lastDate];
}

@end
