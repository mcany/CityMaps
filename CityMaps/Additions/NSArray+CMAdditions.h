//
//  NSArray+CMAdditions.h
//  CityMaps
//
//  Created by mcan on 17/06/2017.
//  Copyright © 2017 mertcan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (CMAdditions)

/**
 Returns object array representation of the NSArray value

 @param klas Class type of the objects
 @return object array representation of the value
 */
- (NSArray *)cm_objectArrayOfClass:(Class)klas;

@end
