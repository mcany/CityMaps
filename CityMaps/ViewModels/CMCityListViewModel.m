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

@implementation CMCityListViewModel

#pragma mark - Network

- (void)fetchCityList
{
    NSArray *array = [NSJSONSerialization cm_jsonArrayWithFileName:kCMCitiesFileName];

    NSArray *unSortedCityList = [array cm_objectArrayOfClass:[CMCity class]];
    
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
    self.filteredCityList = [self.cityList
                             filteredArrayUsingPredicate:[NSPredicate
                                                          predicateWithBlock:^BOOL(CMCity *city, NSDictionary *bindings)
                                                          {
                                                              return [city.name hasPrefix:searchText];
                                                          }]];
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

    cell.nameLabel.text = city.name;
    return cell;
}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    //return [self.cityListDictionary count];
//    return 2;
//}

@end
