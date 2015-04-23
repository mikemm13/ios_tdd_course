//
//  Money.m
//  MoneyConverter
//
//  Created by Miguel Martin on 22/4/15.
//  Copyright (c) 2015 Miguel Martín-Nieto. All rights reserved.
//

#import "Money.h"
#import "NSObject+GNUStepAddons.h"
#import "Money-Private.h"

@implementation Money

- (id)initWithAmount:(NSInteger)amount {
    if (self = [super init]) {
        _amount = @(amount);
    }
    return self;
}

- (Money *)times:(NSInteger)multiplier{
    return [self subclassResponsibility:_cmd] ;
}

#pragma mark - Overwritten

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@ %ld", [self class], (long)[self amount]];
}

- (BOOL)isEqual:(id)object {
    return [self amount] == [object amount];
}

- (NSUInteger)hash {
    return (NSUInteger) self.amount;
}

@end
