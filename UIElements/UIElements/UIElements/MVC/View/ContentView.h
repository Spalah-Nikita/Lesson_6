//
//  ContentView.h
//  UIElements
//
//  Created by Nikita Vintonovich on 8/28/17.
//  Copyright © 2017 Vint-Rock. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BaseCoffee;

@interface ContentView : UIView

@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet UILabel *addMilkLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;
@property (weak, nonatomic) IBOutlet UISwitch *milkSwitcher;
@property (weak, nonatomic) IBOutlet UIButton *startCoffeeButton;

@property (nonatomic, strong, readonly) BaseCoffee *coffeeModel;


- (void)updateWithModel:(BaseCoffee*)coffeeModel;

- (void)updateInterfaceForStartCoffee;
- (void)updateInterfaceForEndCoffee;

- (void)displaySugar;
- (void)displayMilkChanges;

@end
