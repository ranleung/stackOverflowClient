//
//  WebViewController.h
//  stackOverflowClient
//
//  Created by Randall Leung on 11/11/14.
//  Copyright (c) 2014 Randall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetworkController.h"

@interface WebViewController : UIViewController <UITableViewDelegate, UIWebViewDelegate>

@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) NetworkController *sharedManager;

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType;


@end
