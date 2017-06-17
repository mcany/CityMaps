//
//  CMCityListViewController.m
//  CityMaps
//
//  Created by mcan on 17/06/2017.
//  Copyright © 2017 mertcan. All rights reserved.
//

#import "CMCityListViewController.h"
#import "UITableView+CMAdditions.h"
#import "UIView+CMAdditions.h"
#import "CMCityListViewModel.h"
#import "CityListTableCell.h"

@interface CMCityListViewController () <UITableViewDelegate, UISearchResultsUpdating>

@property (nonatomic, strong) CMCityListViewModel *viewModel;
@property (weak, nonatomic) IBOutlet UITableView *cityListTableView;
@property (nonatomic, strong) UISearchController *searchController;

@end

@implementation CMCityListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.viewModel = [CMCityListViewModel new];
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];

    self.cityListTableView.estimatedRowHeight = 100;
    self.cityListTableView.estimatedSectionHeaderHeight = 30;
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

@end
