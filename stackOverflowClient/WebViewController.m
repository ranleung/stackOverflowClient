//
//  WebViewController.m
//  stackOverflowClient
//
//  Created by Randall Leung on 11/11/14.
//  Copyright (c) 2014 Randall. All rights reserved.
//

#import "WebViewController.h"
#import "Constants.h"
#import "NetworkController.h"

@interface WebViewController () <WKNavigationDelegate> {
    WKWebView *webView;
}
@end

@implementation WebViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
    webView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    webView.navigationDelegate = self;
    [self.view addSubview:webView];
    
    NSString *urlString = [NSString stringWithFormat:@"%@?client_id=%@&redirect_uri=%@&scope=read_inbox", kOAuthURL, kClientID, kOAuthDomain];
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}

-(void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
    NSLog(@"%@",navigationAction.request.URL);
    decisionHandler(WKNavigationActionPolicyAllow);
    
    //NSString *requestString = [[[navigationAction request] URL] description];
    NSString *requestString = [[[navigationAction request] URL] absoluteString];
    if ([requestString containsString:@"access_token"]) {
        NSArray *components = [requestString componentsSeparatedByString:@"="];
        NSArray *tokenComponents = [components[1] componentsSeparatedByString:@"&"];
        NSLog(@"%@", tokenComponents[0]);
        NSString *token = tokenComponents[0];
        [[NSUserDefaults standardUserDefaults] setObject:token forKey:@"oauth_token"];
        [NetworkController setToken:token];
        
        //[self dismissViewControllerAnimated:YES completion:nil];
    }
}

//-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
//    NSLog(@"%@", webView.);
//}


//-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
//    if (request) {
//        NSString *requestString = [[request URL] description];
//        NSRange range = [requestString rangeOfString:@"login_success"];
//        
//        if (range.location != NSNotFound) {
//            NSLog(@"GOT IT");
//            NSArray *components= [requestString componentsSeparatedByString:@"="];
//            NSArray *tokenComponents = [components[1] componentsSeparatedByString:@"&"];
//            NSLog(@"%@", tokenComponents[0]);
//            NetworkController.token = tokenComponents[0];
//            //[self dismissViewControllerAnimated:true completion:nil];
//        }
//    }
//
//    return true;
//}

- (IBAction)cancelButton:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}


@end
