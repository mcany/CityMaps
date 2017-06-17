//
//  CMTableViewCell.m
//  CityMaps
//
//  Created by mcan on 17/06/2017.
//  Copyright © 2017 mertcan. All rights reserved.
//

#import "CMTableViewCell.h"

@implementation CMTableViewCell

+ (NSString *)reuseIdentifier
{
    return NSStringFromClass([self class]);
}

@end
