//
//  SplitContainerViewController.m
//  stackOverflowClient
//
//  Created by Randall Leung on 11/10/14.
//  Copyright (c) 2014 Randall. All rights reserved.
//

#import "SplitContainerViewController.h"

@interface SplitContainerViewController ()

@end

@implementation SplitContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UISplitViewController *splitVC = self.childViewControllers[0];
    [splitVC setDelegate:self];
    
}

- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController {
    return false;
}


@end
