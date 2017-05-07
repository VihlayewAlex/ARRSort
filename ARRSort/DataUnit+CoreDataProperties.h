//
//  DataUnit+CoreDataProperties.h
//  ARRSort
//
//  Created by Alex Vihlayew on 4/10/17.
//  Copyright © 2017 Alex. All rights reserved.
//

#import "DataUnit+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface DataUnit (CoreDataProperties)

+ (NSFetchRequest<DataUnit *> *)fetchRequest;

@property (nonatomic) int32_t elements;
@property (nonatomic) double seconds;
@property (nonatomic) int16_t sortAlgorithm;

@end

NS_ASSUME_NONNULL_END
