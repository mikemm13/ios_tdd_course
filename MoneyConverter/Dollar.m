//
//  Dollar.m
//  MoneyConverter
//
//  Created by Miguel Martin on 22/4/15.
//  Copyright (c) 2015 Miguel Martín-Nieto. All rights reserved.
//

#import "Dollar.h"
#import "Money-Private.h"

@implementation Dollar


- (Dollar *)times:(NSInteger)multiplier {
    Dollar *newDollar = [[Dollar alloc] initWithAmount: [self.amount integerValue] * multiplier];
    return newDollar;
}


@end
