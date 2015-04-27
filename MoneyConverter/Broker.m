//
//  Broker.m
//  MoneyConverter
//
//  Created by Miguel Martin Nieto on 26/4/15.
//  Copyright (c) 2015 Miguel Martín-Nieto. All rights reserved.
//

#import "Broker.h"
#import "Money.h"


@implementation Broker

- (instancetype)init
{
    self = [super init];
    if (self) {
        _rates = [@{}mutableCopy];
    }
    return self;
}

- (Money *)reduce:(id<Money>)money toCurrency:(NSString *)currency {
   
    return [money reduceToCurrency:currency withBroker:self];
}

- (void)addRate:(NSInteger)rate fromCurrency:(NSString *)fromCurrency toCurrency:(NSString *)toCurrency {
    [self.rates setObject:@(rate) forKey:[self keyFromCurrency:fromCurrency toCurrency:toCurrency]];
    
    [self.rates setObject:@(1.0/rate) forKey:[self keyFromCurrency:toCurrency toCurrency:fromCurrency]];
}

- (NSString *)keyFromCurrency:(NSString *)fromCurrency toCurrency:(NSString *)toCurrency {
    return [NSString stringWithFormat:@"%@-%@", fromCurrency, toCurrency];
}

@end
