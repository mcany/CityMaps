//
//  UITableView+CMAdditions.m
//  CityMaps
//
//  Created by mcan on 17/06/2017.
//  Copyright © 2017 mertcan. All rights reserved.
//

#import "UITableView+CMAdditions.h"
#import "CMTableViewCell.h"

@implementation UITableView (CMAdditions)

- (void)registerCellWithClass:(Class)cellClass
{
    CMTableViewCell *cell = (CMTableViewCell *)cellClass;
    [self registerNib:[UINib nibWithNibName:NSStringFromClass(cellClass)
                                     bundle:nil] forCellReuseIdentifier:[cell reuseIdentifier]];
}

@end
