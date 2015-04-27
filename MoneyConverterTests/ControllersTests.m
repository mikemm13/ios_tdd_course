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
#import "WalletTableViewController.h"
#import "Wallet.h"

@interface ControllersTests : XCTestCase
@property (nonatomic, strong) SimpleViewController *simpleVC;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) WalletTableViewController *walletVC;
@property (nonatomic, strong) Wallet *wallet;
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
    self.wallet = [[Wallet alloc] initWithAmount:1 currency:@"USD"];
    [self.wallet plus:[Money euroWithAmount:1]];
    self.walletVC = [[WalletTableViewController alloc] initWithModel:self.wallet];
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

- (void)testThatTableHasOneSection {
    NSUInteger sections = [self.walletVC numberOfSectionsInTableView:nil];
    XCTAssertEqual(sections, 1, @"There can only be one");
}

- (void)testThatNumberOfCellsIsNumberOfMoneysPlusOne {
    
    XCTAssertEqual(self.wallet.count + 1, [self.walletVC tableView:nil numberOfRowsInSection:0], @"Number of cells is the number of moneys plus 1");
}

@end
