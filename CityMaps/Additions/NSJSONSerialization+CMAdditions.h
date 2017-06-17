//
//  NSJSONSerialization+CMAdditions.h
//  CityMaps
//
//  Created by mcan on 17/06/2017.
//  Copyright © 2017 mertcan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSJSONSerialization (CMAdditions)

/**
 Finds the given file name in MainBundle
 and returns the data as NSDictionary

 @param fileName File name that will be read
 @return NSDictionary representation of the file contents
 */
+ (NSDictionary *)cm_jsonDictionaryWithFileName:(NSString *)fileName;

/**
 Finds the given file name in MainBundle
 and returns the data as NSArray

 @param fileName File name that will be read
 @return NSArray representation of the file contents
 */
+ (NSArray *)cm_jsonArrayWithFileName:(NSString *)fileName;

@end
