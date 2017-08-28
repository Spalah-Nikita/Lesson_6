//
//  EspressoCoffee.m
//  UIElements
//
//  Created by Nikita Vintonovich on 8/28/17.
//  Copyright © 2017 Vint-Rock. All rights reserved.
//

#import "EspressoCoffee.h"

@implementation EspressoCoffee

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        self.name = @"Espresso";
        self.withMilk = NO;
        self.blockMilk = YES;
        self.coffeePreparingTime = @(5.0f);
    }
    
    return self;
}

@end
