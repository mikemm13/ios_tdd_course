//
//  Dollar.h
//  MoneyConverter
//
//  Created by Miguel Martin on 22/4/15.
//  Copyright (c) 2015 Miguel Martín-Nieto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Money.h"

@interface Dollar : Money

-(Dollar *)times:(NSInteger)multiplier;

@end
