//
//  BaseCoffee.m
//  UIElements
//
//  Created by Nikita Vintonovich on 8/28/17.
//  Copyright © 2017 Vint-Rock. All rights reserved.
//

#import "BaseCoffee.h"

@implementation BaseCoffee

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        self.sugarCount = 3;
    }
    
    return self;
}

- (NSString *)preparingText
{
    return [NSString stringWithFormat:@"%@ is being cooked...", self.name];
}

- (NSString *)coffeeisReadyText
{
    return [NSString stringWithFormat:@"%@ is ready!))", self.name];
}

- (NSString *)sugarText
{
    return (self.sugarCount == 0) ? [NSString stringWithFormat:@"Without sugar"] : [NSString stringWithFormat:@"Sugar: %lu", self.sugarCount];
}

- (NSString *)milkText
{
    return self.withMilk ? @"Coffee with milk" : @"Coffee without milk";
}

- (NSNumber*)timeOfPreparing
{
    return @(self.withMilk ? self.coffeePreparingTime.floatValue + self.milkPreparingTime.floatValue : self.coffeePreparingTime.floatValue);
}

@end
