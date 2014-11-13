//
//  QuestionTest.m
//  stackOverflowClient
//
//  Created by Randall Leung on 11/12/14.
//  Copyright (c) 2014 Randall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Question.h"

@interface QuestionTest : XCTestCase

@property (nonatomic,strong) Question* question;

@end

@implementation QuestionTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.question = [[Question alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testQuestionInit {
    XCTAssertNotNil(self.question, @"Question Class should not be nil");
}

- (void)testJSONParsing {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"sample" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSMutableArray *array = [Question parseJSONDataIntoQuestions:data];
    
    Question *question = array[0];
    XCTAssertTrue(question);
 
}


- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
