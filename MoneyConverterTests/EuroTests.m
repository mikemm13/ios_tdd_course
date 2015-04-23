//
//  EuroTests.m
//  MoneyConverter
//
//  Created by Miguel Martin on 22/4/15.
//  Copyright (c) 2015 Miguel Martín-Nieto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Euro.h"

@interface EuroTests : XCTestCase

@end

@implementation EuroTests

-(void)testMultiplication {
    Euro *euro = [[Euro alloc] initWithAmount:5];
    Euro *ten = [[Euro alloc] initWithAmount:10];
    Euro *total = [euro times:2];
    XCTAssertEqualObjects(total, ten, @"5€ * 2 should be 10€");
}

-(void)testEquality {
    Euro *five = [[Euro alloc] initWithAmount:5];
    Euro *ten = [[Euro alloc] initWithAmount:10];
    Euro *total = [five times:2];
    XCTAssertEqualObjects(total, ten, @"Equivalent objects should be equal");
}

- (void)testHash {
    Euro *twoA = [[Euro alloc] initWithAmount:2];
    Euro *twoB = [[Euro alloc] initWithAmount:2];
    XCTAssertEqual([twoA hash], [twoB hash], @"Equal objects must have same hash");
}

- (void) testAmountStorage {
    Euro *euro = [[Euro alloc] initWithAmount:2];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    XCTAssertEqual(2, [[euro performSelector:@selector(amount)] integerValue], @"The value retrieved should be the same as the stored");
#pragma clang diagnostic pop
}

@end
