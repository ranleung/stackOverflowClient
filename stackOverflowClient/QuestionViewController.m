//
//  QuestionViewController.m
//  stackOverflowClient
//
//  Created by Randall Leung on 11/10/14.
//  Copyright (c) 2014 Randall. All rights reserved.
//

#import "QuestionViewController.h"
#import "NetworkController.h"

@interface QuestionViewController ()


@end

@implementation QuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NetworkController *sharedManager = [NetworkController sharedManager];
    [sharedManager fetchQuestionsWithSearchTerm:@"swift" completionHandler:nil];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
