//
//  CMViewController.m
//  CityMaps
//
//  Created by mcan on 17/06/2017.
//  Copyright © 2017 mertcan. All rights reserved.
//

#import "CMViewController.h"

@interface CMViewController()

@property (nonatomic, strong) UIView *loadingView;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;

@end

@implementation CMViewController

- (void)showLoadingView
{
    [self.view addSubview:self.loadingView];
    [self.loadingView bringSubviewToFront:self.view];
    [self.activityIndicator startAnimating];
}

- (void)hideLoadingView
{
    [self.loadingView removeFromSuperview];
    [self.activityIndicator stopAnimating];
}

-(UIView *)loadingView
{
    if (_loadingView == nil)
    {
        UIView *overlayView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        overlayView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        activityIndicator.center = overlayView.center;
        [overlayView addSubview:activityIndicator];

        _loadingView = overlayView;
        _activityIndicator = activityIndicator;
    }
    return _loadingView;
}

@end
