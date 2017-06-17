//
//  CMCoordination.m
//  CityMaps
//
//  Created by mcan on 17/06/2017.
//  Copyright © 2017 mertcan. All rights reserved.
//

#import "CMCoordination.h"
#import "NSDictionary+CMAdditions.h"

NSString *const kCMLonKey = @"lon";
NSString *const kCMLatKey = @"lat";

@implementation CMCoordination

- (instancetype)initWithJSONDictionary:(NSDictionary *)dictionary
{
    double lat = [dictionary cm_doubleForKey:kCMLatKey];
    double lon = [dictionary cm_doubleForKey:kCMLonKey];

    self = [super initWithLatitude:lat
                         longitude:lon];
    return self;
}

@end
