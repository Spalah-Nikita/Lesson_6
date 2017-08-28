//
//  AmericanoCoffee.m
//  UIElements
//
//  Created by Nikita Vintonovich on 8/28/17.
//  Copyright © 2017 Vint-Rock. All rights reserved.
//

#import "AmericanoCoffee.h"

@implementation AmericanoCoffee

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        self.name = @"Americano";
        self.withMilk = YES;
        self.coffeePreparingTime = @(6.0f);
        self.milkPreparingTime = @(4.0f);
    }
    
    return self;
}

@end
