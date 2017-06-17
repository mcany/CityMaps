//
//  UIView+CMAdditions.m
//  CityMaps
//
//  Created by mcan on 17/06/2017.
//  Copyright © 2017 mertcan. All rights reserved.
//

#import "UIView+CMAdditions.h"

@implementation UIView (CMAdditions)

+ (instancetype)instanceFromNib
{
    NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class])
                                                 owner:self
                                               options:nil];
    if (nibArray.count > 0)
    {
        return [nibArray firstObject];
    }
    return nil;
}

@end
