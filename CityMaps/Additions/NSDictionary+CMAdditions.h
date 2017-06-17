//
//  NSDictionary+CMAdditions.h
//  CityMaps
//
//  Created by mcan on 17/06/2017.
//  Copyright © 2017 mertcan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (CMAdditions)

/**
 Returns double representation of the NSDictionary value

 @param key The key value of the dictionary
 @return double representation of the value
 */
- (double)cm_doubleForKey:(id)key;

/**
 Returns NSString representation of the NSDictionary value

 @param key The key value of the dictionary
 @return NSString representation of the value
 */
- (NSString *)cm_stringForKey:(id)key;

/**
 Returns NSNumber representation of the NSDictionary value

 @param key The key value of the dictionary
 @return NSNumber representation of the value
 */
- (NSNumber *)cm_numberForKey:(id)key;

/**
 Returns NSArray representation of the NSDictionary value

 @param key The key value of the dictionary
 @return NSArray representation of the value
 */
- (NSArray *)cm_arrayForKey:(id)key;

/**
 Returns NSDictionary representation of the NSDictionary value

 @param key The key value of the dictionary
 @return NSDictionary representation of the value
 */
- (NSDictionary *)cm_dictionaryForKey:(id)key;

/**
 Returns object representation of the NSDictionary value

 @param key key The key value of the dictionary
 @param klas Class type of the object
 @return object representation of the value
 */
- (id)cm_objectForKey:(id)key ofClass:(Class)klas;


/**
 Returns object representation of the NSDictionary value

 @param klas Class type of the object
 @return object representation of the value
 */
- (id)cm_objectOfClass:(Class)klas;

/**
 Returns object array representation of the NSDictionary value

 @param key key The key value of the dictionary
 @param klas Class type of the objects
 @return object array representation of the value
 */
- (NSArray *)cm_objectArrayForKey:(id)key ofClass:(Class)klas;

@end
