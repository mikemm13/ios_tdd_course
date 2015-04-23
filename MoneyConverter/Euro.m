//
//  Euro.m
//  MoneyConverter
//
//  Created by Miguel Martin on 22/4/15.
//  Copyright (c) 2015 Miguel Martín-Nieto. All rights reserved.
//

#import "Euro.h"
#import "Money-Private.h"

@implementation Euro


- (Euro *)times:(NSInteger)multiplier {
    Euro *newEuro = [[Euro alloc] initWithAmount:[self.amount integerValue] * multiplier];
    return newEuro;
}



@end
