//
//  CityListTableCell.h
//  CityMaps
//
//  Created by mcan on 17/06/2017.
//  Copyright © 2017 mertcan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMTableViewCell.h"

@class CMCity;

@interface CityListTableCell : CMTableViewCell

- (void)updateCellwithCity:(CMCity *)city;

@end
