//
//  Question.h
//  stackOverflowClient
//
//  Created by Randall Leung on 11/10/14.
//  Copyright (c) 2014 Randall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSArray *tags;
@property (nonatomic, strong) NSString *ownerID;
@property (nonatomic, strong) NSString *userName;

- (instancetype)initWithDictionary: (NSDictionary *)questionDic;
- (NSMutableArray *)parseJSONDataIntoQuestions: (NSData *)rawJSONData;

@end
