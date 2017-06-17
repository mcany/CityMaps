//
//  CMCoordination.h
//  CityMaps
//
//  Created by mcan on 17/06/2017.
//  Copyright © 2017 mertcan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#import "CMJSONObjectInitializationProtocol.h"

@interface CMCoordination : CLLocation <CMJSONObjectInitializationProtocol>

@end
