//
//  NSkitTests.m
//  MMKitDemoTests
//
//  Created by 张一鸣 on 2017/12/26.
//  Copyright © 2017年 张一鸣. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+MMString.h"
@interface NSkitTests : XCTestCase

@end

@implementation NSkitTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testTransToJson {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSString * jsonString = @"{\"ID\":{\"Content\":268,\"type\":\"text\"},\"ContractTemplateID\":{\"Content\":65,\"type\":\"text\"}}";
    NSDictionary * dict = [jsonString mm_transJson:nil];
    NSLog(@"dict: %@",dict.description);
//    XCTAssertTrue([[[jsonString mm_transJson:nil] objectForKey:@"type"] isEqualToString:@"text"]);
}

- (void)testCombineJson {
    NSString * jsonString1 = @"{\"ID\":{\"Content\":268,\"type\":\"text\"},\"ContractTemplateID\":{\"Content\":65,\"type\":\"text\"}}";
    NSString * jsonString2 = @"{\"ID2\":{\"Content\":268,\"type\":\"text\"},\"ContractTemplateID2\":{\"Content\":65,\"type\":\"text\"}}";
    NSString * result = [jsonString1 mm_appendJson:jsonString2];
    
    NSLog(@"--------%@",result);

}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
