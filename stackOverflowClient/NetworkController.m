//
//  NetworkController.m
//  stackOverflowClient
//
//  Created by Randall Leung on 11/10/14.
//  Copyright (c) 2014 Randall. All rights reserved.
//

#import "NetworkController.h"

@implementation NetworkController

#pragma mark - Singleton

@synthesize network;

+ (id)sharedManager {
    static NetworkController *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

#pragma mark - Network Call

- (void)fetchQuestionsWithSearchTerm:(NSString *)key completionHandler: (void(^)(NSError *error, NSMutableArray *response))completionHandler {
    
    //Will move to init
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    self.urlSession = [NSURLSession sessionWithConfiguration:configuration];
    
    NSString *urlWithKey = [NSString stringWithFormat:@"https://api.stackexchange.com/2.2/search?order=desc&sort=activity&tagged=%@&site=stackoverflow", key];
    NSURL *url = [[NSURL alloc] initWithString:urlWithKey];
    
    NSURLSessionDataTask *dataTask = [self.urlSession dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error != 0) {
            NSLog(@"%@", [error localizedDescription]);
        } else {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
            NSInteger statusCode = [httpResponse statusCode];
            if (statusCode >= 200 && statusCode <= 299) {
                NSMutableArray *questions = [Question parseJSONDataIntoQuestions:data];
                NSLog(@"Number of questions found: %lu", (unsigned long)questions.count);
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    completionHandler(nil, questions);
                }];
            } else {
                NSLog(@"Error! Status code is: %lu", statusCode);
            }
        }
    }];
    [dataTask resume];
    
    

}

@end












