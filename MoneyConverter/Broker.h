//
//  Broker.h
//  MoneyConverter
//
//  Created by Miguel Martin Nieto on 26/4/15.
//  Copyright (c) 2015 Miguel Martín-Nieto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Money.h"

@interface Broker : NSObject

@property (nonatomic, strong) NSMutableDictionary *rates;

- (Money *)reduce:(id<Money>)money toCurrency:(NSString *)currency;
- (void)addRate:(NSInteger)rate fromCurrency:(NSString *)fromCurrency toCurrency:(NSString *)toCurrency;
- (NSString *)keyFromCurrency:(NSString *)fromCurrency toCurrency:(NSString *)toCurrency;
@end
