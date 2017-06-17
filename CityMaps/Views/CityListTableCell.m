//
//  CityListTableCell.m
//  CityMaps
//
//  Created by mcan on 17/06/2017.
//  Copyright © 2017 mertcan. All rights reserved.
//

#import "CityListTableCell.h"
#import "CMCity.h"

@interface CityListTableCell()

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;

@end

@implementation CityListTableCell

- (void)updateCellwithCity:(CMCity *)city
{
    NSString *cellString = [NSString stringWithFormat:@"%@, %@", city.name, city.country];
    self.nameLabel.text = cellString;
}

@end
