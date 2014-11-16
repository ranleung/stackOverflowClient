//
//  Question.m
//  stackOverflowClient
//
//  Created by Randall Leung on 11/10/14.
//  Copyright (c) 2014 Randall. All rights reserved.
//

#import "Question.h"

@interface Question()

@end

@implementation Question

- (id)init {
    self = [super init];
    return self;
}

- (instancetype)initWithDictionary: (NSDictionary *)questionDic {
    if (self = [super init]) {
        self.title = [questionDic valueForKey:@"title"];
        self.tags = questionDic[@"tags"];
        self.ownerID = [questionDic valueForKeyPath:@"owner.user_id"];
        self.userName = [questionDic valueForKeyPath:@"owner.display_name"];
    }
    return self;
}

- (NSMutableArray *)parseJSONDataIntoQuestions: (NSData *)rawJSONData {
    NSError *error = nil;
    NSMutableArray *questions = [[NSMutableArray alloc] init];
    NSDictionary *searchJSONDictionary = [NSJSONSerialization JSONObjectWithData:rawJSONData options:0 error: &error];
    for(NSDictionary *questionDictionary in searchJSONDictionary[@"items"]) {
        Question *questionObject = [[Question alloc] initWithDictionary:questionDictionary];
        [questions addObject:questionObject];
    }
    return questions;
    
}

@end
























