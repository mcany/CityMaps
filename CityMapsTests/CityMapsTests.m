//
//  CityMapsTests.m
//  CityMapsTests
//
//  Created by mcan on 17/06/2017.
//  Copyright © 2017 mertcan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSArray+CMAdditions.h"
#import "CMCityListViewModel.h"
#import "CMCity.h"
#import "CMCoordination.h"

@interface CityMapsTests : XCTestCase

@property (nonatomic, strong) CMCityListViewModel *viewModel;
@property (nonatomic, copy) NSArray<CMCity *> *cityArray;
@property (nonatomic, strong) CMCity *city1;
@property (nonatomic, strong) CMCity *city2;
@property (nonatomic, strong) CMCity *city3;
@property (nonatomic, strong) CMCity *city4;
@property (nonatomic, strong) CMCity *city5;

@end

@implementation CityMapsTests

- (void)setUp
{
    [super setUp];
    self.viewModel = [CMCityListViewModel new];

    self.city1 = [CMCity new];
    self.city1.name = @"Alabama";
    self.city1.country = @"US";
    self.city2 = [CMCity new];
    self.city2.name = @"Albuquerque";
    self.city2.country = @"US";
    self.city3 = [CMCity new];
    self.city3.name = @"Anaheim";
    self.city3.country = @"US";
    self.city4 = [CMCity new];
    self.city4.name = @"Arizona";
    self.city4.country = @"US";
    self.city5 = [CMCity new];
    self.city5.name = @"Sydney";
    self.city5.country = @"US";

    self.cityArray = @[self.city1, self.city2, self.city3, self.city4, self.city5];
    self.viewModel.cityList = self.cityArray;
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [self.viewModel filterCityListWithText:@""];
    [super tearDown];
}

- (void)testSearchA
{
    NSString *search = @"A";
    NSArray *filteredArray = @[self.city1, self.city2, self.city3, self.city4];
    [self.viewModel filterCityListWithText:search];
    NSArray *modelArray = self.viewModel.filteredCityList;
    XCTAssertTrue([filteredArray isEqualToArray:modelArray]);
}

- (void)testSearchAl
{
    NSString *search = @"Al";
    NSArray *filteredArray = @[self.city1, self.city2];
    [self.viewModel filterCityListWithText:search];
    NSArray *modelArray = self.viewModel.filteredCityList;
    XCTAssertTrue([filteredArray isEqualToArray:modelArray]);
}

- (void)testSearchAlb
{
    NSString *search = @"Alb";
    NSArray *filteredArray = @[self.city2];
    [self.viewModel filterCityListWithText:search];
    NSArray *modelArray = self.viewModel.filteredCityList;
    XCTAssertTrue([filteredArray isEqualToArray:modelArray]);
}

- (void)testSearchS
{
    NSString *search = @"S";
    NSArray *filteredArray = @[self.city5];
    [self.viewModel filterCityListWithText:search];
    NSArray *modelArray = self.viewModel.filteredCityList;
    XCTAssertTrue([filteredArray isEqualToArray:modelArray]);
}

- (void)testSearchEmpty
{
    NSString *search = @"";
    NSArray *filteredArray = @[];
    [self.viewModel filterCityListWithText:search];
    NSArray *modelArray = self.viewModel.filteredCityList;
    XCTAssertTrue([filteredArray isEqualToArray:modelArray]);
}

- (void)testSearchNil
{
    NSString *search = nil;
    NSArray *filteredArray = @[];
    [self.viewModel filterCityListWithText:search];
    NSArray *modelArray = self.viewModel.filteredCityList;
    XCTAssertTrue([filteredArray isEqualToArray:modelArray]);
}

- (void)testSearchNumber
{
    NSString *search = nil;
    NSArray *filteredArray = @[];
    [self.viewModel filterCityListWithText:search];
    NSArray *modelArray = self.viewModel.filteredCityList;
    XCTAssertTrue([filteredArray isEqualToArray:modelArray]);
}

@end
