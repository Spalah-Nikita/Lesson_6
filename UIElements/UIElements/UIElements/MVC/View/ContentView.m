//
//  ContentView.m
//  UIElements
//
//  Created by Nikita Vintonovich on 8/28/17.
//  Copyright © 2017 Vint-Rock. All rights reserved.
//

#import "ContentView.h"
#import "BaseCoffee.h"

@interface ContentView ()

@property (nonatomic, strong) BaseCoffee *coffeeModel;

@end

@implementation ContentView

- (void)updateWithModel:(BaseCoffee*)coffeeModel
{
    self.coffeeModel = coffeeModel;
    BOOL isEnable = !coffeeModel.blockMilk;
    
    [self.milkSwitcher setEnabled:isEnable];
    [self.addMilkLabel setEnabled:isEnable];
    
    [self.milkSwitcher setOn:coffeeModel.withMilk];
}

- (void)updateInterfaceForStartCoffee
{
    [self.startCoffeeButton setEnabled:NO];
    self.infoLabel.text = [self.coffeeModel preparingText];
}

- (void)updateInterfaceForEndCoffee
{
    [self.startCoffeeButton setEnabled:YES];
    self.infoLabel.text = [self.coffeeModel coffeeisReadyText];
}

- (void)displaySugar
{
    self.infoLabel.text = [self.coffeeModel sugarText];
}

- (void)displayMilkChanges
{
    self.infoLabel.text = [self.coffeeModel milkText];
}

@end
