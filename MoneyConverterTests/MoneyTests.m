//
//  MoneyTests.m
//  MoneyConverter
//
//  Created by Miguel Martin on 22/4/15.
//  Copyright (c) 2015 Miguel Martín-Nieto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Money.h"

@interface MoneyTests : XCTestCase

@end

@implementation MoneyTests

- (void)testThatTimesRaisesException {
    Money *money = [[Money alloc] initWithAmount:1];
    XCTAssertThrows([money times:2], @"Should raise an exception");
}

@end
