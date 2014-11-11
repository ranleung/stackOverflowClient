//
//  NetworkController.m
//  stackOverflowClient
//
//  Created by Randall Leung on 11/10/14.
//  Copyright (c) 2014 Randall. All rights reserved.
//

#import "NetworkController.h"

@implementation NetworkController

//Singleton
@synthesize network;

+ (id)sharedManager {
    static NetworkController *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    return self;
}

//To Call
//NetworkController *sharedManager = [NetworkController sharedManager];



- (void)fetchQuestionsWithSearchTerm:(NSString*)key completionHandler:(void(^)(NSError *error, NSArray *repsonse)) completionHandler {
    
    NSString *urlPlaceholder = [NSString stringWithFormat:@"https://api.stackexchange.com/2.2/search?order=desc&sort=activity&tagged=%@&site=stackoverflow", key];
    NSURL *url = [NSURL URLWithString:urlPlaceholder];
    
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSHTTPURLResponse *httpResponse = response;
        
        
    }];
    

}

@end












