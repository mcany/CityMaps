//
//  NSArray+CMAdditions.m
//  CityMaps
//
//  Created by mcan on 17/06/2017.
//  Copyright © 2017 mertcan. All rights reserved.
//

#import "NSArray+CMAdditions.h"
#import "NSDictionary+CMAdditions.h"

@implementation NSArray (CMAdditions)

- (NSArray *)cm_objectArrayOfClass:(Class)klas
{
    NSMutableArray *klasObjectArray = [NSMutableArray new];
    for (NSDictionary *dictionary in self)
    {
        [klasObjectArray addObject:[dictionary cm_objectOfClass:klas]];
    }
    return klasObjectArray;
}

@end
