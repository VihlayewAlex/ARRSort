//
//  ViewController.m
//  ARRSort
//
//  Created by Alex on 4/8/17.
//  Copyright © 2017 Alex. All rights reserved.
//

#import "ViewController.h"
#import "ArraySortManager.hpp"
#import "TimeMeasurer.h"
#import "ARRSort-Swift.h"
#import "MeasuringDataProvider.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    
    NSLog(@"Started!");

    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)detailsButtonClicked:(NSButton *)sender {
    [self performSegueWithIdentifier:@"ShowDataSegue" sender:sender];
}

- (IBAction)sortButtonClicked:(NSButton *)sender {

    SortingAlgorithm sortingAlgorithm;
    NSString* sortingAlgorithmName;

    switch ([sender tag]) {
        case 1:
            sortingAlgorithm = SortingAlgotrithmMergeSort;
            sortingAlgorithmName = @"Merge Sort";
            break;
        case 2:
            sortingAlgorithm = SortingAlgotrithmHeapSort;
            sortingAlgorithmName = @"Heap Sort";
            break;
        default:
            sortingAlgorithm = SortingAlgotrithmQuickSort;
            sortingAlgorithmName = @"Quick Sort";
            break;
    }

    // Runnig test sortings
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{

        for (int i = 1; i <= 7; i++) {
            NSInteger testArraySize = 10 * pow(10, i);

            MeasuringDataProvider* dataProvider = [[MeasuringDataProvider alloc] init];
            MeasuringData* measuringData = [dataProvider getSortingDataForArrayOfSize:testArraySize withSortingAlgorithm:&sortingAlgorithm];

            NSLog(@"It takes %f seconds to sort an array of %ld elements with %@.", [measuringData sortingTime], (long)[measuringData arraySize], sortingAlgorithmName);
        }

    });
}

- (void)prepareForSegue:(NSStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqual:@"ShowDataSegue"]) {
        SortTestsDataVC* destinationVC = [segue destinationController];
        
        NSButton* clickedButton = (NSButton*)sender;
        NSInteger sortType = clickedButton.tag;
        destinationVC.sortType = sortType;
        
    }
    
}


@end
