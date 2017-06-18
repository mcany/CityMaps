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

/**
 Sorted city array. Made public for test purposes
 */
@property (nonatomic, copy) NSArray<CMCity *> *cityList;

/**
 Filtered array of the city list. Made public for test purposes
 */
@property (nonatomic, copy) NSArray<CMCity *> *filteredCityList;

/**
 Return city list of the model depends on whether filter is active or not

 @return city array, either filtered array or the original array
 */
- (NSArray<CMCity *> *)cities;

/**
 Fetches the city list information
 */
- (void)fetchCityListWithCompletion:(void (^) (NSError *error))completion;

/**
 Filters the city array with given search text

 @param searchText text that will be used for filtering
 */
- (void)filterCityListWithText:(NSString *)searchText;

@end
