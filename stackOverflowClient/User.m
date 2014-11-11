//
//  User.m
//  stackOverflowClient
//
//  Created by Randall Leung on 11/10/14.
//  Copyright (c) 2014 Randall. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype) init: (NSDictionary *)userDict {
    if (self = [super init]) {
        self.userName = userDict[@"name"];
    }
    return self;
}

-(NSMutableArray *)parseJSONDataIntoUser: (NSData *)rawJSONData {
    NSError * error = nil;
    NSMutableArray *users = [[NSMutableArray alloc] init];
    NSDictionary *searchJSONDictionary = [NSJSONSerialization JSONObjectWithData:rawJSONData options:0 error:&error];
    for(NSDictionary *userDic in searchJSONDictionary) {
        User *userObject = [[User alloc] init:userDic];
        [users addObject:userObject];
    }
    return users;
}



@end
