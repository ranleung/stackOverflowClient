//
//  Question.m
//  stackOverflowClient
//
//  Created by Randall Leung on 11/10/14.
//  Copyright (c) 2014 Randall. All rights reserved.
//

#import "Question.h"

@implementation Question

- (id)init: (NSDictionary *)JSONDictionary {
    if (self = [super init]) {
        self.title = JSONDictionary[@"title"];
        self.tags = JSONDictionary[@"tags"];
        NSDictionary *owner = JSONDictionary[@"owner"];
        self.ownerID = owner[@"user_id"];
        self.userName = owner[@"display_name"];
    }
    return self;
}

+ (NSMutableArray *)parseJSONDataIntoQuestions: (NSData *)rawJSONData {
    NSMutableArray *questions = [[NSMutableArray alloc] init];
    NSError *error = nil;
    NSDictionary *searchJSONDictionary = [NSJSONSerialization JSONObjectWithData:rawJSONData options:0 error: &error];
    for(NSDictionary *question in searchJSONDictionary[@"items"]) {
        Question *questionObject = [[Question alloc] init: question];
        [questions addObject:questionObject];
    }
    return questions;
    
};

@end
























