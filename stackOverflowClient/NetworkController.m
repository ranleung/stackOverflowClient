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

    NSURL *url = [NSURL URLWithString:@"https://api.stackexchange.com/2.2/search?order=desc&sort=activity&tagged=swift&site=stackoverflow"];
    
    NSURLSessionDataTask *dataTask = [self.urlSession dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error != 0) {
            NSLog(@"%@", [error localizedDescription]);
        } else {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
            NSInteger statusCode = [httpResponse statusCode];
            if (statusCode >= 200 && statusCode <= 299) {
                NSLog(@"GOT SOME RESPONSE");
                
            }
        }
    }];
    [dataTask resume];
    
    

}

@end












