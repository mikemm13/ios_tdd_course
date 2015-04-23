//
//  NSObject+GNUStepAddons.m
//  MoneyConverter
//
//  Created by Miguel Martin on 22/4/15.
//  Copyright (c) 2015 Miguel Martín-Nieto. All rights reserved.
//

#import <objc/runtime.h>
#import "NSObject+GNUStepAddons.h"

@implementation NSObject (GNUStepAddons)

- (id)subclassResponsibility:(SEL)aSel {
    char prefix = class_isMetaClass(object_getClass(self)) ? '+': '-';
    [NSException raise:NSInvalidArgumentException format:@"%@%c%@ should be overriden by its subclass", NSStringFromClass([self class]), prefix, NSStringFromSelector(aSel)];
    return self;
}

@end
