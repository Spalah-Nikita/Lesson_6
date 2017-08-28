//
//  CoffeeViewController.m
//  UIElements
//
//  Created by Nikita Vintonovich on 8/26/17.
//  Copyright © 2017 Vint-Rock. All rights reserved.
//

#import "CoffeeViewController.h"

#import "BaseCoffee.h"
#import "AmericanoCoffee.h"
#import "CappuccinoCoffee.h"
#import "EspressoCoffee.h"
#import "ContentView.h"

@interface CoffeeViewController ()

@property (nonatomic, strong) NSArray *coffeesArray;
@property (nonatomic, assign) NSInteger sugerCount;

@property (weak, nonatomic) IBOutlet ContentView *contentView;
@property (nonatomic, strong) BaseCoffee *currentCoffee;

@end

@implementation CoffeeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    for (NSInteger i = 0; i < self.coffeesArray.count; i++)
    {
        BaseCoffee *coffee = (BaseCoffee*)self.coffeesArray[i];
        [self.contentView.segmentControl setTitle:coffee.name forSegmentAtIndex:i];
    }
    
    self.currentCoffee = self.coffeesArray.firstObject;
    [self.contentView updateWithModel:self.currentCoffee];
}

- (IBAction)backAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)startCoffeeAction:(UIButton *)sender
{
    [self.contentView updateInterfaceForStartCoffee];
    [self performSelector:@selector(coffeeIsReady)
               withObject:nil
               afterDelay:[self.currentCoffee timeOfPreparing].floatValue];
}

- (IBAction)sliderAction:(UISlider *)sender
{
    self.contentView.infoLabel.alpha = sender.value;
}

- (IBAction)segmentContolAction:(UISegmentedControl *)sender
{
    self.currentCoffee = self.coffeesArray[sender.selectedSegmentIndex];
    [self.contentView updateWithModel:self.currentCoffee];
}

- (NSArray *)coffeesArray
{
    if (!_coffeesArray)
    {
        _coffeesArray = @[[AmericanoCoffee new], [CappuccinoCoffee new], [EspressoCoffee new]];
    }
    return _coffeesArray;
}

- (IBAction)milkSwitchActoin:(UISwitch *)sender
{
    self.currentCoffee.withMilk = sender.isOn;
    [self.contentView displayMilkChanges];
}

- (IBAction)sugarAction:(UIStepper *)sender
{
    self.currentCoffee.sugarCount = (NSInteger)sender.value;
    [self.contentView displaySugar];
}

- (void)coffeeIsReady
{
    [self.contentView updateInterfaceForEndCoffee];
}

@end
