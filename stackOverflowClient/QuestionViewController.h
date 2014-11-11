//
//  QuestionViewController.h
//  stackOverflowClient
//
//  Created by Randall Leung on 11/10/14.
//  Copyright (c) 2014 Randall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;

@property (strong, nonatomic) IBOutlet UITableView *tableView;


@end
