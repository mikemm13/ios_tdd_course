//
//  Money.h
//  MoneyConverter
//
//  Created by Miguel Martin on 22/4/15.
//  Copyright (c) 2015 Miguel Martín-Nieto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Money : NSObject


-(id)initWithAmount:(NSInteger) amount;
-(Money *)times:(NSInteger) multiplier;

@end
