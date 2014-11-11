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
    
    self.title = @"Questions";
    
    self.tableView.estimatedRowHeight = 148.0;
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
    QuestionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QUESTIONS_CELL"];
    Question *question = self.questions[indexPath.row];
    //cell.textLabel.text = question.title;
    cell.questionLabel.text = question.title;
    cell.userName.text = question.userName;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
