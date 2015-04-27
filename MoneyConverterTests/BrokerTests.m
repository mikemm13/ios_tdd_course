//
//  BrokerTests.m
//  MoneyConverter
//
//  Created by Miguel Martin Nieto on 26/4/15.
//  Copyright (c) 2015 Miguel Martín-Nieto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Money.h"
#import "Broker.h"

@interface BrokerTests : XCTestCase

@property (nonatomic, strong) Broker *emptyBroker;
@property (nonatomic, strong) Money *oneDollar;

@end

@implementation BrokerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.emptyBroker = [[Broker alloc] init];
    self.oneDollar = [Money dollarWithAmount:1];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.emptyBroker = nil;
    self.oneDollar = nil;
    [super tearDown];
}

- (void)testSimpleReduction {
    Money *sum = [[Money dollarWithAmount:5] plus:[Money dollarWithAmount:5]];
    Money *reduced = [self.emptyBroker reduce:sum toCurrency:@"USD"];
    XCTAssertEqualObjects(sum, reduced, @"Conversion to same currency should be a NOP");
}

// $10 == 5€ 2:1
- (void)testReduction {
    Money *dollar = [Money dollarWithAmount:10];
    Money *euro = [Money euroWithAmount:5];
    [self.emptyBroker addRate:2 fromCurrency:@"EUR" toCurrency:@"USD"];
    Money *converted = [self.emptyBroker reduce:dollar toCurrency:@"EUR"];
    XCTAssertEqualObjects(converted, euro, @"$10 == €5 2:1");
}

- (void)testThatNoRateRaisesException {
    XCTAssertThrows([self.emptyBroker reduce:self.oneDollar toCurrency:@"EUR"], @"No rates should cause exception");
}

- (void)testThatNilConversionDoesNotChangeMoney {
    
    XCTAssertEqualObjects(self.oneDollar, [self.emptyBroker reduce:self.oneDollar toCurrency:@"USD"], @"A nil conversion should have no effect");
}

@end
