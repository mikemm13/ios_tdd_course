//
//  DollarTests.m
//  MoneyConverter
//
//  Created by Miguel Martin on 22/4/15.
//  Copyright (c) 2015 Miguel Martín-Nieto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Dollar.h"

@interface DollarTests : XCTestCase

@end

@implementation DollarTests

- (void)testMultiplication {
    Dollar *five = [[Dollar alloc] initWithAmount:5];
    Dollar *total = [five times:2];
    Dollar *ten = [[Dollar alloc] initWithAmount:10];
    XCTAssertEqualObjects(total, ten, @"5$ * 2 should be equal to 10$");
}

-(void)testEquality {
    Dollar *five = [[Dollar alloc] initWithAmount:5];
    Dollar *ten = [[Dollar alloc] initWithAmount:10];
    Dollar *total = [five times:2];
    XCTAssertEqualObjects(total, ten, @"Equivalent objects should be equal");
    XCTAssertFalse([total isEqual:five], @"Non equivalent objects should not be equal");
}

- (void)testHash {
    Dollar *twoA = [[Dollar alloc] initWithAmount:2];
    Dollar *twoB = [[Dollar alloc] initWithAmount:2];
    XCTAssertEqual([twoA hash], [twoB hash], @"Equal objects must have same hash");
}

- (void) testAmountStorage {
    Dollar *dollar = [[Dollar alloc] initWithAmount:2];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    XCTAssertEqual(2, [[dollar performSelector:@selector(amount)] integerValue], @"The value retrieved should be the same as the stored");
#pragma clang diagnostic pop
}

@end
