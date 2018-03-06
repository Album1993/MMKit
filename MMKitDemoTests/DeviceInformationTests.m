//
//  DeviceInformationTests.m
//  MMKitDemoTests
//
//  Created by 张一鸣 on 2017/12/26.
//  Copyright © 2017年 张一鸣. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MMKit.h"


@interface DeviceInformationTests : XCTestCase

@end


@implementation DeviceInformationTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSLog(@"%@", [MMDeviceInformation appVersion]);
    XCTAssertTrue([[MMDeviceInformation appVersion] isEqualToString:@"1.0.1"]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
