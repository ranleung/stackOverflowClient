//
//  Question.h
//  stackOverflowClient
//
//  Created by Randall Leung on 11/10/14.
//  Copyright (c) 2014 Randall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property (nonatomic, strong) NSString *ID;
@property (nonatomic, strong) NSString *question;
@property (nonatomic, strong) NSString *answer;

@end
