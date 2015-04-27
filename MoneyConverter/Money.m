//
//  Money.m
//  MoneyConverter
//
//  Created by Miguel Martin on 22/4/15.
//  Copyright (c) 2015 Miguel Martín-Nieto. All rights reserved.
//

#import "Money.h"
#import "NSObject+GNUStepAddons.h"
#import "Broker.h"

@interface Money ()

@property (nonatomic, strong) NSNumber *amount;

@end

@implementation Money

+ (instancetype)euroWithAmount:(NSInteger)amount {
    return [[Money alloc] initWithAmount:amount currency:@"EUR"];
}

+ (instancetype)dollarWithAmount:(NSInteger)amount {
    return [[Money alloc] initWithAmount:amount currency:@"USD"];
}

- (id)initWithAmount:(NSInteger)amount currency:(NSString *)currency {
    if (self = [super init]) {
        _amount = @(amount);
        _currency = currency;
    }
    return self;
}

- (id<Money>)times:(NSInteger)multiplier{
    Money *newMoney = [[Money alloc] initWithAmount:[self.amount integerValue] * multiplier currency:self.currency];
    return newMoney;
}

- (id<Money>)plus:(Money *)other {
    NSInteger totalAmount = [self.amount integerValue] + [other.amount integerValue];
    Money *total = [[Money alloc] initWithAmount:totalAmount currency:self.currency];
    return total;
}

- (id<Money>)reduceToCurrency:(NSString *)currency withBroker:(Broker *)broker {
    Money *result;
    double rate = [[broker.rates objectForKey:[broker keyFromCurrency:self.currency toCurrency:currency]] doubleValue] ;
    if ([self.currency isEqual:currency]) {
        result = self;
    } else if (rate == 0) {
        [NSException raise:@"NoConversionRateException" format:@"Must have a conversion from %@ to %@", self.currency, currency];
    } else {
        NSInteger newAmount = [self.amount integerValue] * rate;
        
        result = [[Money alloc] initWithAmount:newAmount currency:currency];
    }
    
    return result;

}

#pragma mark - Overwritten

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@: %@ %@>", [self class], self.currency, self.amount];
}

- (BOOL)isEqual:(id)object {
    if ([self.currency isEqual:[object currency]]) {
        return [self.amount isEqualToNumber:[object amount]];
    } else {
        return NO;
    }
}

- (NSUInteger)hash {
    return [self.amount integerValue];
}

@end
