//
//  CMJSONObjectInitializationProtocol.h
//  CityMaps
//
//  Created by mcan on 17/06/2017.
//  Copyright © 2017 mertcan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CMJSONObjectInitializationProtocol <NSObject>

/**
 object initialization protocol from JSON dictionary

 @param dictionary NSDictionary for JSON
 @return Newly initialized object
 */
- (instancetype)initWithJSONDictionary:(NSDictionary *)dictionary;

@end
