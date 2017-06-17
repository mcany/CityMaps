//
//  CMCity.h
//  CityMaps
//
//  Created by mcan on 17/06/2017.
//  Copyright © 2017 mertcan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMJSONObjectInitializationProtocol.h"

@class CMCoordination;

@interface CMCity : NSObject <CMJSONObjectInitializationProtocol>

/**
 Country that city belongs
 */
@property (nonatomic, copy) NSString *country;

/**
 Name of the city
 */
@property (nonatomic, copy) NSString *name;

/**
 ID of the city
 */
@property (nonatomic, copy) NSNumber *_id;

/**
 Coordination of the city
 */
@property (nonatomic, strong) CMCoordination *coordination;

@end
