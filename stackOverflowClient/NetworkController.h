//
//  NetworkController.h
//  stackOverflowClient
//
//  Created by Randall Leung on 11/10/14.
//  Copyright (c) 2014 Randall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Question.h"

@interface NetworkController : NSObject

@property (nonatomic, strong) NSOperationQueue *operationQueue;
@property (nonatomic, retain) NSString *network;
@property (nonatomic, strong) NSString *token;

- (void)fetchQuestionsWithSearchTerm:(NSString*)key completionHandler:(void(^)(NSError *error, NSMutableArray *repsonse)) completionHandler;

+ (id)sharedManager;

@end
