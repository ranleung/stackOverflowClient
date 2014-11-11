//
//  NetworkController.h
//  stackOverflowClient
//
//  Created by Randall Leung on 11/10/14.
//  Copyright (c) 2014 Randall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkController : NSObject

//NSString * network;


@property (nonatomic, strong) NSOperationQueue *imageQueue;
@property (nonatomic, retain) NSString *network;
- (void)fetchQuestionsWithSearchTerm:(NSString*)key completionHandler:(void(^)(NSError *error, NSArray *repsonse)) completionHandler;

+ (id)sharedManager;

@end
