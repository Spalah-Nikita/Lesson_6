//
//  CappuccinoCoffee.m
//  UIElements
//
//  Created by Nikita Vintonovich on 8/28/17.
//  Copyright © 2017 Vint-Rock. All rights reserved.
//

#import "CappuccinoCoffee.h"

@implementation CappuccinoCoffee

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        self.name = @"Cappuccino";
        self.withMilk = YES;
        self.coffeePreparingTime = @(8.0f);
        self.milkPreparingTime = @(3.0f);
    }
    
    return self;
}

@end
