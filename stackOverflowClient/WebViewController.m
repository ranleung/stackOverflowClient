//
//  WebViewController.m
//  stackOverflowClient
//
//  Created by Randall Leung on 11/11/14.
//  Copyright (c) 2014 Randall. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@property (nonatomic, strong) NSString *publicKey;
@property (nonatomic, strong) NSString *oAuthDomain;
@property (nonatomic, strong) NSString *clientID;
@property (nonatomic, strong) NSString *oAuthURL;

@end

@implementation WebViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.publicKey = @"5Vpg3uTqCwAssGUjZx73wg((";
    self.oAuthDomain = @"https://stackexchange.com/oauth/login_success";
    self.clientID = @"3197";
    self.oAuthDomain = @"https://stackexchange.com/oauth/dialog";
    
    self.sharedManager = [NetworkController sharedManager];
    
    self.webView.delegate = self;
    
    //NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"%@?client_id=%@&redirect_uri=%@&scope=read_inbox",self.oAuthURL,self.clientID,self.oAuthDomain]];
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@?client_id=%@&redirect_uri=%@&scope=read_inbox", self.oAuthURL, self.clientID, self.oAuthDomain]]];
    [self.webView loadRequest:request];
   
}


-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    if (request) {
        NSString *requestString = [[request URL] description];
        NSRange range = [requestString rangeOfString:@"login_success"];
        
        if (range.location != NSNotFound) {
            NSLog(@"GOT IT");
            NSArray *components= [requestString componentsSeparatedByString:@"="];
            NSArray *tokenComponents = [components[0] componentsSeparatedByString:@"&"];
            NSLog(@"%@", tokenComponents);
            self.sharedManager.token = tokenComponents[0];
            [self dismissViewControllerAnimated:true completion:nil];
        }
    }
    
    return true;
}

- (IBAction)cancelButton:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}


@end
