//
//  TimeMeasurer.h
//  ARRSort
//
//  Created by Alex Vihlayew on 4/9/17.
//  Copyright © 2017 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeMeasurer : NSObject

- (void) startCounting;
- (NSTimeInterval) getTimeInterval;

@end
