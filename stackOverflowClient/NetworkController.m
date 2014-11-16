//
//  NetworkController.m
//  stackOverflowClient
//
//  Created by Randall Leung on 11/10/14.
//  Copyright (c) 2014 Randall. All rights reserved.
//

#import "NetworkController.h"
#import "Question.h"
#import "Constants.h"

@interface NetworkController()

@property (nonatomic, strong) NSString *token;

@end

@implementation NetworkController

- (instancetype)init {
    if (self.urlSession == nil) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.urlSession = [NSURLSession sessionWithConfiguration:configuration];
        NSString *authToken = [[NSUserDefaults standardUserDefaults] valueForKey:@"authToken"];
        if (authToken) {
            self.token = authToken;
            NSLog(@"Token Retrieved");
        }
    }
    return self;
}

#pragma mark - Singleton

+ (instancetype)sharedManager {
    static NetworkController *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

#pragma mark - Private Methods

+ (void)setToken:(NSString *)token {
    [[self sharedManager] setToken:token];
}

- (void)fetchQuestionsWithSearchTerm:(NSString *)key completionHandler: (void(^)(NSError *error, NSMutableArray *response))completionHandler {
    
    
//    NSString *urlWithKey = [NSString stringWithFormat:@"https://api.stackexchange.com/2.2/search?order=desc&sort=activity&tagged=%@&site=stackoverflow", key];
    
    NSString *urlWithKey = [NSString stringWithFormat:@"https://api.stackexchange.com/2.2/search/advanced?order=desc&sort=activity&site=stackoverflow&q=%@&access_token=%@&key=%@",key,self.token,kClientKey];
    
    
    NSURL *url = [[NSURL alloc] initWithString:urlWithKey];
    
    NSURLSessionDataTask *dataTask = [self.urlSession dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error != nil) {
            NSLog(@"%@", [error localizedDescription]);
        } else {
            if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
                NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                NSInteger statusCode = [httpResponse statusCode];
                if (statusCode >= 200 && statusCode <= 299) {
                    NSMutableArray *questions = [[Question alloc] parseJSONDataIntoQuestions:data];
                    NSLog(@"Number of questions found: %lu", (unsigned long)questions.count);
                    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                        completionHandler(nil, questions);
                    }];
                } else if (statusCode >= 400 && statusCode <= 499) {
                    NSLog(@"Error! Status code is: %lu", statusCode);
                    NSLog(@"This is the clients fault");
                } else if (statusCode >= 500 && statusCode <= 599) {
                    NSLog(@"Error! Status code is: %lu", statusCode);
                    NSLog(@"This is the server's fault");
                } else {
                    NSLog(@"Error! Status code is: %lu", statusCode);
                    NSLog(@"Bad Response");
                }
            }
        }
    }];
    [dataTask resume];
    
    

}

@end












