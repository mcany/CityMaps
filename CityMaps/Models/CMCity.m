//
//  CMCity.m
//  CityMaps
//
//  Created by mcan on 17/06/2017.
//  Copyright © 2017 mertcan. All rights reserved.
//

#import "CMCity.h"
#import "CMCoordination.h"
#import "NSDictionary+CMAdditions.h"

NSString *const kCMCountryKey = @"country";
NSString *const kCMNameKey = @"name";
NSString *const kCMIDKey = @"_id";
NSString *const kCMCoordinationKey = @"coord";

@implementation CMCity

- (instancetype)initWithJSONDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if (self)
    {
        _country = [dictionary cm_stringForKey:kCMCountryKey];
        _name = [dictionary cm_stringForKey:kCMNameKey];
        __id = [dictionary cm_numberForKey:kCMIDKey];
        _coordination = [dictionary cm_objectForKey:kCMCoordinationKey ofClass:[CMCoordination class]];
    }
    
    return self;
}

- (BOOL)isEqual:(CMCity *)object
{
    BOOL isCountrySame = [self.country isEqualToString:object.country];
    BOOL isNameSame = [self.name isEqualToString:object.name];
    BOOL isIDSame = self._id == object._id;
    return isCountrySame && isNameSame && isIDSame;
}

@end
