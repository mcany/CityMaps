//
//  UITableView+CMAdditions.h
//  CityMaps
//
//  Created by mcan on 17/06/2017.
//  Copyright © 2017 mertcan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (CMAdditions)

/**
 Registers self with the given cell class

 @param cellClass Class of the registered cell
 */
- (void)registerCellWithClass:(Class)cellClass;

@end
