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

#pragma mark - Equality

- (BOOL)isEqualToArray:(NSArray *)array {
    if (!array || [self count] != [array count]) {
        return NO;
    }

    for (NSUInteger idx = 0; idx < [array count]; idx++) {
        if (![self[idx] isEqual:array[idx]]) {
            return NO;
        }
    }
    
    return YES;
}

- (BOOL)isEqual:(id)object {
    if (self == object) {
        return YES;
    }

    if (![object isKindOfClass:[NSArray class]]) {
        return NO;
    }

    return [self isEqualToArray:(NSArray *)object];
}

@end
