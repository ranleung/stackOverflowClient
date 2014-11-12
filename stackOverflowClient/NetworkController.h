//
//  NetworkController.h
//  stackOverflowClient
//
//  Created by Randall Leung on 11/10/14.
//  Copyright (c) 2014 Randall. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NetworkController : NSObject

@property (nonatomic, strong) NSOperationQueue *operationQueue;
@property (nonatomic, strong) NSURLSession *urlSession;
@property (nonatomic, retain) NSString *network;


- (void)fetchQuestionsWithSearchTerm:(NSString*)key completionHandler:(void(^)(NSError *error, NSMutableArray *repsonse)) completionHandler;

+ (void)setToken:(NSString *)token;

+ (id)sharedManager;

@end
