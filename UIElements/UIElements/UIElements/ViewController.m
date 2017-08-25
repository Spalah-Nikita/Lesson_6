//
//  ViewController.m
//  UIElements
//
//  Created by Nikita Vintonovich on 8/25/17.
//  Copyright © 2017 Vint-Rock. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIButton *pushMeButton;
@property (nonatomic, strong) NSTimer *timer;
@property (weak, nonatomic) IBOutlet UIView *loaderView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loaderWidthCondtraint;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.pushMeButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [self.pushMeButton setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    [self.pushMeButton setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    
    [self.pushMeButton setTitle:@"Приготовление..." forState:UIControlStateDisabled];
    
    self.loaderWidthCondtraint.constant = 0.0f;
}

- (NSTimer*)timer
{
    if (_timer == nil)
    {
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(timeIsOver) userInfo:nil repeats:YES];
    }
    return _timer;
}

- (void)timeIsOver
{
    self.loaderWidthCondtraint.constant += 20;
    
    if (self.loaderWidthCondtraint.constant > 300)
    {
        [self.timer invalidate];
        self.timer = nil;
        
        self.loaderView.backgroundColor = [UIColor clearColor];
        self.loaderWidthCondtraint.constant = 0.0f;
        self.pushMeButton.enabled = YES;
    }
}

- (IBAction)buttonWasTapped:(UIButton *)sender
{
    self.loaderView.backgroundColor = [UIColor redColor];
    [self timer];
    self.pushMeButton.enabled = NO;
}

#pragma mark - Text Field Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField.text.length + string.length > 5)
    {
        [self.pushMeButton setTitle:@"Max lenght must be 5" forState:UIControlStateNormal];
        return NO;
    }
    
    [self.pushMeButton setTitle:[NSString stringWithFormat:@"%@%@", textField.text, string]
                       forState:UIControlStateNormal];
    
    return YES;
}

@end
