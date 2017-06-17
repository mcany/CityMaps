//
//  NSDictionary+CMAdditions.m
//  CityMaps
//
//  Created by mcan on 17/06/2017.
//  Copyright © 2017 mertcan. All rights reserved.
//

#import "NSDictionary+CMAdditions.h"
#import "CMJSONObjectInitializationProtocol.h"

NSString *const kCMNotConformProtocolException = @"Class %@ does not conform to %@";

@implementation NSDictionary (CMAdditions)

- (double)cm_doubleForKey:(id)key
{
    if ([self isKeyInValid:key])
    {
        return 0.0;
    }

    id object = [self objectForKey:key];
    if ([object isKindOfClass:[NSNumber class]] || [object isKindOfClass:[NSString class]])
    {
        return [object doubleValue];
    }

    return 0.0;
}

- (NSString *)cm_stringForKey:(id)key
{
    if ([self isKeyInValid:key])
    {
        return nil;
    }
    
    id object = [self objectForKey:key];
    if ([object isKindOfClass:[NSString class]])
    {
        return object;
    }
    else if ([object respondsToSelector:@selector(stringValue)])
    {
        return [object performSelector:@selector(stringValue)];
    }
    
    return nil;
}

- (NSNumber *)cm_numberForKey:(id)key
{
    if ([self isKeyInValid:key])
    {
        return nil;
    }
    
    id object = [self objectForKey:key];
    if ([object isKindOfClass:[NSNumber class]])
    {
        return object;
    }
    
    return nil;
}

- (NSDictionary *)cm_arrayForKey:(id)key
{
    if ([self isKeyInValid:key])
    {
        return nil;
    }

    id object = [self objectForKey:key];
    if ([object isKindOfClass:[NSArray class]])
    {
        return object;
    }
    return nil;
}

- (NSDictionary *)cm_dictionaryForKey:(id)key
{
    if ([self isKeyInValid:key])
    {
        return nil;
    }

    id object = [self objectForKey:key];
    if ([object isKindOfClass:[NSDictionary class]])
    {
        return object;
    }
    return nil;
}

- (id)cm_objectForKey:(id)key ofClass:(Class)klas
{
    NSDictionary *dictionary = [self cm_dictionaryForKey:key];
    if (dictionary)
    {
        return [dictionary cm_objectOfClass:klas];
    }
    return nil;
}

- (id)cm_objectOfClass:(Class)klas
{
    if (![klas conformsToProtocol:@protocol(CMJSONObjectInitializationProtocol)])
    {
        NSString *exception = [self exceptionInitializationStringForKey:@"" ofClass:klas];
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:exception
                                     userInfo:nil];
    }
    return [[klas alloc] initWithJSONDictionary:self];
}

- (NSArray *)cm_objectArrayForKey:(id)key ofClass:(Class)klas
{
    if (![klas conformsToProtocol:@protocol(CMJSONObjectInitializationProtocol)])
    {
        NSString *exception = [self exceptionInitializationStringForKey:key ofClass:klas];
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:exception
                                     userInfo:nil];
    }

    NSMutableArray *klasObjectArray = [NSMutableArray new];
    NSArray *dictionaryArray = [self cm_arrayForKey:key];
    for (NSDictionary *dictionary in dictionaryArray)
    {
        [klasObjectArray addObject:[[klas alloc]  initWithJSONDictionary:dictionary]];
    }
    return klasObjectArray;
}

// MARK: - Private Helpers

- (BOOL)isKeyInValid:(id)key
{
    return !key;
}

- (NSString *)exceptionInitializationStringForKey:(id)key ofClass:(Class)klas
{
    NSString *exception = [NSString stringWithFormat:kCMNotConformProtocolException,
                           NSStringFromClass(klas),
                           NSStringFromProtocol(@protocol(CMJSONObjectInitializationProtocol))];
    return exception;
}

@end
