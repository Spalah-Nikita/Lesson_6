//
//  CoffeeViewController.m
//  UIElements
//
//  Created by Nikita Vintonovich on 8/26/17.
//  Copyright © 2017 Vint-Rock. All rights reserved.
//

#import "CoffeeViewController.h"

@interface CoffeeViewController ()

@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet UILabel *addMilkLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;
@property (weak, nonatomic) IBOutlet UISwitch *milkSwitcher;
@property (weak, nonatomic) IBOutlet UIButton *startCoffeeButton;

@property (nonatomic, strong) NSArray *segmentControlTitles;
@property (nonatomic, assign) NSInteger sugerCount;

@end

@implementation CoffeeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    for (NSInteger i = 0; i < self.segmentControlTitles.count; i++)
    {
        NSString *title = self.segmentControlTitles[i];
        [self.segmentControl setTitle:title forSegmentAtIndex:i];
    }
}

- (IBAction)backAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)startCoffeeAction:(UIButton *)sender
{
    [self.startCoffeeButton setEnabled:NO];
    self.infoLabel.text = @"Waiting for coffee...";
    
    CGFloat time = 1.0f;
    
    switch (self.segmentControl.selectedSegmentIndex)
    {
        case 0:
            time = 5.0f;
            break;
        case 1:
            time = 8.0f;
            break;
        case 2:
            time = 3.0f;
            break;
            
        default:
            break;
    }
    
    [self performSelector:@selector(coffeeIsReady) withObject:nil afterDelay:time];
}

- (IBAction)sliderAction:(UISlider *)sender
{
    self.infoLabel.alpha = sender.value;
}

- (IBAction)segmentContolAction:(UISegmentedControl *)sender
{
    self.infoLabel.text = [[sender titleForSegmentAtIndex:sender.selectedSegmentIndex] uppercaseString];
    BOOL isEnabled = sender.selectedSegmentIndex != 2;
    
    [self.milkSwitcher setEnabled:isEnabled];
    [self.addMilkLabel setEnabled:isEnabled];
}

- (NSArray *)segmentControlTitles
{
    if (!_segmentControlTitles)
    {
        _segmentControlTitles = @[@"Americano", @"Cappuccino", @"Espresso"];
    }
    return _segmentControlTitles;
}

- (IBAction)milkSwitchActoin:(UISwitch *)sender
{
    self.infoLabel.text = sender.isOn ? @"Coffee with milk" : @"Coffee without milk";
}

- (IBAction)sugarAction:(UIStepper *)sender
{
    if ((NSInteger)sender.value == 0)
    {
        self.infoLabel.text = @"Without Sugar";
    }
    else
    {
        self.infoLabel.text = [NSString stringWithFormat:@"Sugar: %lu", (NSInteger)sender.value];
    }
}

- (void)coffeeIsReady
{
    [self.startCoffeeButton setEnabled:YES];
    self.infoLabel.text = [NSString stringWithFormat:@"%@ is ready!", [self.segmentControl titleForSegmentAtIndex:self.segmentControl.selectedSegmentIndex]];
}

@end
