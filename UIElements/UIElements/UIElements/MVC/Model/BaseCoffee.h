//
//  BaseCoffee.h
//  UIElements
//
//  Created by Nikita Vintonovich on 8/28/17.
//  Copyright © 2017 Vint-Rock. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseCoffee : NSObject

@property (nonatomic, assign) BOOL withMilk;
@property (nonatomic, assign) BOOL blockMilk;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger sugarCount;
@property (nonatomic, assign) NSNumber *coffeePreparingTime;
@property (nonatomic, assign) NSNumber *milkPreparingTime;

- (NSString *)preparingText;
- (NSString *)coffeeisReadyText;
- (NSString *)sugarText;
- (NSString *)milkText;

- (NSNumber *)timeOfPreparing;

@end
