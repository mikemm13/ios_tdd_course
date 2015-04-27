//
//  Wallet.m
//  MoneyConverter
//
//  Created by Miguel Martin Nieto on 26/4/15.
//  Copyright (c) 2015 Miguel Martín-Nieto. All rights reserved.
//

#import "Wallet.h"

@interface Wallet ()

@property (nonatomic, strong) NSMutableArray *moneys;

@end

@implementation Wallet

- (id)initWithAmount:(NSInteger)amount currency:(NSString *)currency {
    if (self = [super init]) {
        Money *money = [[Money alloc] initWithAmount:amount currency:currency];
        _moneys = [NSMutableArray array];
        [_moneys addObject:money];
    }
    return self;
}

- (id<Money>)plus:(Money *)other {
    [self.moneys addObject:other];
    return self;
}

- (id<Money>)times:(NSInteger)multiplier {
    NSMutableArray *newMoneys = [NSMutableArray arrayWithCapacity:self.moneys.count];
    for (Money *each in self.moneys) {
        Money *newMoney = [each times:multiplier];
        [newMoneys addObject:newMoney];
    }
    self.moneys = newMoneys;
    return self;
}

- (id<Money>)reduceToCurrency:(NSString *)currency withBroker:(Broker *)broker {
    Money *result = [[Money alloc] initWithAmount:0 currency:currency];
    for (Money *each in self.moneys) {
        result = [[each reduceToCurrency:currency withBroker:broker] plus:result];
    }
    return result;
}

@end
