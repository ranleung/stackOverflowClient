//
//  QuestionViewController.m
//  stackOverflowClient
//
//  Created by Randall Leung on 11/10/14.
//  Copyright (c) 2014 Randall. All rights reserved.
//

#import "QuestionViewController.h"

@interface QuestionViewController ()
@end

@implementation QuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"Questions", @"Questions");
    
    [[self view] setBackgroundColor:[UIColor whiteColor]];
    
    //Register Nib
    [[self tableView] registerNib:[UINib nibWithNibName:@"QuestionCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"QUESTION_CELL"];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.sharedManager = [NetworkController sharedManager];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.searchBar.delegate = self;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"%@",searchBar);
    [self.sharedManager fetchQuestionsWithSearchTerm:self.searchBar.text completionHandler:^(NSError *error, NSMutableArray *response) {
        if (error != nil) {
            NSLog(@"%@", error.localizedDescription);
        } else {
            self.questions = response;
            [self.tableView reloadData];
        }
    }];
    [self.searchBar resignFirstResponder];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.questions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QuestionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QUESTION_CELL"];
    Question *question = self.questions[indexPath.row];
    cell.questionLabel.text = question.title;
    cell.userName.text = question.userName;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
