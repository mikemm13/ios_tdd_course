//
//  Money.h
//  MoneyConverter
//
//  Created by Miguel Martin on 22/4/15.
//  Copyright (c) 2015 Miguel Martín-Nieto. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Money;
@class Broker;

@protocol Money <NSObject>

-(id)initWithAmount:(NSInteger) amount currency:(NSString *)currency;
-(id<Money>)times:(NSInteger) multiplier;
-(id<Money>)plus:(Money *)other;
-(id<Money>)reduceToCurrency:(NSString *)currency withBroker:(Broker *)broker;

@end

@interface Money : NSObject<Money>

@property (nonatomic, readonly) NSString *currency;
@property (nonatomic, readonly) NSNumber *amount;

+(id) euroWithAmount:(NSInteger)amount;
+(id) dollarWithAmount:(NSInteger)amount;



@end
