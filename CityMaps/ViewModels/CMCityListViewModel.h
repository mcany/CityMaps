//
//  CMCityListViewModel.h
//  CityMaps
//
//  Created by mcan on 17/06/2017.
//  Copyright © 2017 mertcan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class CMCity;

@interface CMCityListViewModel : NSObject <UITableViewDataSource>

@property (nonatomic, copy) NSDictionary<NSString *, CMCity *> *cityListDictionary;

- (NSArray<CMCity *> *)cities;
- (void)fetchCityList;
- (void)filterCityListWithText:(NSString *)searchText;

@end
