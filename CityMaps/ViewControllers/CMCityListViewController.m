//
//  CMCityListViewController.m
//  CityMaps
//
//  Created by mcan on 17/06/2017.
//  Copyright © 2017 mertcan. All rights reserved.
//

#import "CMCityListViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "UITableView+CMAdditions.h"
#import "UIView+CMAdditions.h"
#import "CMCityListViewModel.h"
#import "CityListTableCell.h"
#import "CMCity.h"
#import "CMCoordination.h"

@interface CMCityListViewController () <UITableViewDelegate, UISearchResultsUpdating>

@property (nonatomic, strong) CMCityListViewModel *viewModel;
@property (nonatomic, strong) UISearchController *searchController;

@property (nonatomic, weak) IBOutlet UITableView *cityListTableView;

@end

@implementation CMCityListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.viewModel = [CMCityListViewModel new];
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];

    self.cityListTableView.estimatedRowHeight = 100;
    [self.cityListTableView registerCellWithClass:[CityListTableCell class]];
    self.cityListTableView.dataSource = self.viewModel;
    self.cityListTableView.delegate = self;

    self.searchController.searchResultsUpdater = self;
    self.searchController.dimsBackgroundDuringPresentation = NO;
    self.definesPresentationContext = YES;
    self.cityListTableView.tableHeaderView = self.searchController.searchBar;

    [self fetchListData];
}


#pragma mark - Data Fetch

- (void)fetchListData
{
    [self.viewModel fetchCityList];
    [self.cityListTableView reloadData];
}

#pragma mark - UISearchResultsUpdating

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    [self.viewModel filterCityListWithText:searchController.searchBar.text];
    [self.cityListTableView reloadData];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CMCity *selectedCity = [[self.viewModel cities] objectAtIndex:indexPath.row];
    [self openMapsWithCoordinate:selectedCity.coordination.coordinate];
}

#pragma mark - Maps

- (void)openMapsWithCoordinate:(CLLocationCoordinate2D)coordinate
{
    MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:coordinate addressDictionary:nil];
    MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
    [mapItem openInMapsWithLaunchOptions:nil];
}

@end
