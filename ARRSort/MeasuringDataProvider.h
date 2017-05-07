//
//  MeasuringDataProvider.h
//  ARRSort
//
//  Created by Alex Vihlayew on 5/6/17.
//  Copyright © 2017 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MeasuringData.h"

typedef enum : NSUInteger {
    SortingAlgotrithmQuickSort,
    SortingAlgotrithmMergeSort,
    SortingAlgotrithmHeapSort,
} SortingAlgorithm;

@interface MeasuringDataProvider : NSObject

- (MeasuringData*)getSortingDataForArrayOfSize:(NSInteger) size withSortingAlgorithm:(const SortingAlgorithm*) algorithm;

@end
