//
//  ControllersTests.m
//  MoneyConverter
//
//  Created by Miguel Martin Nieto on 26/4/15.
//  Copyright (c) 2015 Miguel Martín-Nieto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "SimpleViewController.h"

@interface ControllersTests : XCTestCase
@property (nonatomic, strong) SimpleViewController *simpleVC;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UILabel *label;
@end

@implementation ControllersTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.simpleVC = [[SimpleViewController alloc] initWithNibName:nil bundle:nil];
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button setTitle:@"Hola" forState:UIControlStateNormal];
    self.label = [[UILabel alloc] initWithFrame:CGRectZero];
    self.simpleVC.displayLabel = self.label;
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.simpleVC = nil;
    self.button = nil;
    self.label = nil;
    [super tearDown];
}

- (void)testThatTextOnLabelIsEqualToTextOnButton {
    [self.simpleVC displayText:self.button];
    XCTAssertEqualObjects(self.button.titleLabel.text, self.label.text, @"Button and label should have the same text");
}

@end
