//
//  Question.m
//  stackOverflowClient
//
//  Created by Randall Leung on 11/10/14.
//  Copyright (c) 2014 Randall. All rights reserved.
//

#import "Question.h"

@implementation Question

- (instancetype)init: (NSDictionary *)questionDic {
    if (self = [super init]) {
        self.title = questionDic[@"title"];
        self.tags = questionDic[@"tags"];
        NSDictionary *owner = questionDic[@"owner"];
        self.ownerID = owner[@"user_id"];
        self.userName = owner[@"display_name"];
    }
    return self;
}

+ (NSMutableArray *)parseJSONDataIntoQuestions: (NSData *)rawJSONData {
    NSError *error = nil;
    NSMutableArray *questions = [[NSMutableArray alloc] init];
    NSDictionary *searchJSONDictionary = [NSJSONSerialization JSONObjectWithData:rawJSONData options:0 error: &error];
    for(NSDictionary *questionDictionary in searchJSONDictionary[@"items"]) {
        Question *questionObject = [[Question alloc] init: questionDictionary];
        [questions addObject:questionObject];
    }
    return questions;
    
};

@end
























