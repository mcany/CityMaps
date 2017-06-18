//
//  CMCityListViewModel.m
//  CityMaps
//
//  Created by mcan on 17/06/2017.
//  Copyright © 2017 mertcan. All rights reserved.
//


#import "CMCityListViewModel.h"
#import "NSJSONSerialization+CMAdditions.h"
#import "NSArray+CMAdditions.h"
#import "CityListTableCell.h"
#import "CMCity.h"

NSString *const kCMCitiesFileName = @"cities";

@interface CMCityListViewModel()

/**
 Here I saved the previously searched result in this dictionary.
 So that the search mechanism will not be triggered when the user deletes its search text.
 While the user is deleting the text, the saved result will be shown.
 However everytime the user enters a new key, the search will start with the already filtered array.
 */
@property (nonatomic, strong) NSMutableDictionary<NSString *, NSArray *> *savedSearchDictionary;

@property (nonatomic, assign) BOOL isFilterActive;

@end

@implementation CMCityListViewModel

- (NSArray<CMCity *> *)cities
{
    if (self.isFilterActive)
    {
        return self.filteredCityList;
    }
    return self.cityList;
}

#pragma mark - Network

- (void)fetchCityListWithCompletion:(void (^) (NSError *error))completion
{
    [self fetchCityList];
    completion(nil);
}

- (void)fetchCityList
{
    self.savedSearchDictionary = [NSMutableDictionary new];
    self.filteredCityList = [NSArray new];

    NSArray *jsonArray = [NSJSONSerialization cm_jsonArrayWithFileName:kCMCitiesFileName];
    NSArray *unSortedCityList = [jsonArray cm_objectArrayOfClass:[CMCity class]];

    self.cityList = [self sortedCityList:unSortedCityList];
}

#pragma mark - Private Helpers

- (NSArray *)sortedCityList:(NSArray *)cityList
{
    NSSortDescriptor *sortDescriptor;
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name"
                                                 ascending:YES];
    return [cityList sortedArrayUsingDescriptors:@[sortDescriptor]];
}

#pragma mark - Filter

- (void)filterCityListWithText:(NSString *)searchText
{
    [self updateSavedSearchDictionaryWithKey:searchText];

    if (searchText.length < 1)
    {
        self.isFilterActive = NO;
        self.filteredCityList = [NSArray new];
        return;
    }
    self.isFilterActive = YES;

    NSArray *savedSearch = [self.savedSearchDictionary valueForKey:searchText];
    if (savedSearch.count > 0)
    {
        self.filteredCityList = savedSearch;
    }
    else
    {
        NSArray *filteredSearch;
        if (self.filteredCityList.count > 0)
        {
            filteredSearch = [self filterArray:self.filteredCityList withText:searchText];
        }
        else
        {
            filteredSearch = [self.cityList
                              filteredArrayUsingPredicate:[NSPredicate
                                                           predicateWithBlock:^BOOL(CMCity *city, NSDictionary *bindings)
                                                           {
                                                               return [city.name hasPrefix:searchText];
                                                           }]];
        }

        [self.savedSearchDictionary setObject:filteredSearch forKey:searchText];
        self.filteredCityList = filteredSearch;
    }
}

- (void)updateSavedSearchDictionaryWithKey:(NSString *)newKey
{
    NSMutableDictionary *copyDictionary = [self.savedSearchDictionary mutableCopy];
    NSArray *dictionaryKeys = [self.savedSearchDictionary allKeys];
    for (NSString *key in dictionaryKeys)
    {
        if (![newKey containsString:key])
        {
            [copyDictionary removeObjectForKey:key];
        }
    }
    self.savedSearchDictionary = copyDictionary;
}

- (NSArray *)filterArray:(NSArray *)array withText:(NSString *)text
{
    return [array
            filteredArrayUsingPredicate:[NSPredicate
                                         predicateWithBlock:^BOOL(CMCity *city, NSDictionary *bindings)
                                         {
                                             return [city.name hasPrefix:text];
                                         }]];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.isFilterActive)
    {
        return [self.filteredCityList count];
    }
    return [self.cityList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CityListTableCell *cell = [tableView dequeueReusableCellWithIdentifier:[CityListTableCell reuseIdentifier]];

    CMCity *city;

    if (self.isFilterActive && self.filteredCityList.count >= indexPath.row)
    {
        city = [self.filteredCityList objectAtIndex:indexPath.row];
    }
    else if (!self.isFilterActive && self.cityList.count >= indexPath.row)
    {
        city = [self.cityList objectAtIndex:indexPath.row];
    }

    [cell updateCellwithCity:city];
    return cell;
}

@end
