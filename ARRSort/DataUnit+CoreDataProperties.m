//
//  DataUnit+CoreDataProperties.m
//  ARRSort
//
//  Created by Alex Vihlayew on 4/10/17.
//  Copyright © 2017 Alex. All rights reserved.
//

#import "DataUnit+CoreDataProperties.h"

@implementation DataUnit (CoreDataProperties)

+ (NSFetchRequest<DataUnit *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"DataUnit"];
}

@dynamic elements;
@dynamic seconds;
@dynamic sortAlgorithm;

@end
