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

@property (nonatomic, strong) NSMutableDictionary<NSString *, NSArray *> *savedSearchDictionary;
@property (nonatomic, copy) NSArray<CMCity *> *cityList;
@property (nonatomic, copy) NSArray<CMCity *> *filteredCityList;

@end

@implementation CMCityListViewModel

- (NSArray<CMCity *> *)cities
{
    if (self.filteredCityList.count > 0)
    {
        return self.filteredCityList;
    }
    return self.cityList;
}

#pragma mark - Network

- (void)fetchCityList
{
    self.savedSearchDictionary = [NSMutableDictionary new];

    NSArray *jsonArray = [NSJSONSerialization cm_jsonArrayWithFileName:kCMCitiesFileName];
    NSArray *unSortedCityList = [jsonArray cm_objectArrayOfClass:[CMCity class]];

    self.cityList = [self sortedCityList:unSortedCityList];

    self.cityListDictionary = [NSDictionary dictionaryWithObjects:self.cityList
                                                          forKeys:[self.cityList valueForKey:@"country"]];
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
    NSArray *savedSearch = [self.savedSearchDictionary valueForKey:searchText];
    if (savedSearch.count > 0)
    {
        self.filteredCityList = savedSearch;
    }
    else
    {
        NSArray *filteredSearch = [self.cityList
                                   filteredArrayUsingPredicate:[NSPredicate
                                                                predicateWithBlock:^BOOL(CMCity *city, NSDictionary *bindings)
                                                                {
                                                                    return [city.name hasPrefix:searchText];
                                                                }]];
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

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.filteredCityList.count > 0)
    {
        return [self.filteredCityList count];
    }
    return [self.cityList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CityListTableCell *cell = [tableView dequeueReusableCellWithIdentifier:[CityListTableCell reuseIdentifier]];

    CMCity *city;

    if (self.filteredCityList.count > 0)
    {
        city = [self.filteredCityList objectAtIndex:indexPath.row];
    }
    else
    {
        city = [self.cityList objectAtIndex:indexPath.row];
    }

    [cell updateCellwithCity:city];
    return cell;
}

@end
