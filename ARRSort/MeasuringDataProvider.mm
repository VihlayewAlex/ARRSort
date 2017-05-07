//
//  MeasuringDataProvider.m
//  ARRSort
//
//  Created by Alex Vihlayew on 5/6/17.
//  Copyright © 2017 Alex. All rights reserved.
//

#import "MeasuringDataProvider.h"
#import "TimeMeasurer.h"
#import "ArraySortManager.hpp"
#import "MeasuringData.h"


@implementation MeasuringDataProvider


- (MeasuringData*)getSortingDataForArrayOfSize:(NSInteger) size withSortingAlgorithm:(const SortingAlgorithm*) algorithm {
    uint32_t* testArray = new uint32_t[size];
    for (int i = 0; i < size; i++) {
        *(testArray + i) = arc4random_uniform(1000);
    }

    // Starting timer
    TimeMeasurer* timer = [[TimeMeasurer alloc] init];
    [timer startCounting];

    // Initializing sortManager
    ArraySortManager sortManager;
    // Calling sort function depends on algorithm
    switch (*algorithm) {
        case SortingAlgotrithmQuickSort:
            sortManager.quicksort_cpp(testArray, size);
            break;
        case SortingAlgotrithmMergeSort:
            sortManager.mergesort_cpp(testArray, size);
            break;
        case SortingAlgotrithmHeapSort:
            sortManager.heapsort_cpp(testArray, size);
            break;
    }
    // Getting sorting time
    NSTimeInterval sortingTime = [timer getTimeInterval];
    // Setting data
    MeasuringData* newMeasuringData = [[MeasuringData alloc] init];
    [newMeasuringData setArraySize:size];
    [newMeasuringData setSortingTime:sortingTime];

    // Logging array
//    for (int i = 0; i < size; i++) {
//        NSLog(@"%u", *(testArray + i));
//    }

    return newMeasuringData;
}


@end


