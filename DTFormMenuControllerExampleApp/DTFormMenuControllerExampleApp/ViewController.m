//
//  ViewController.m
//  DTFormMenuControllerExampleApp
//
//  Created by Daniel Thengvall on 3/1/15.
//  Copyright (c) 2015 DTHENG. All rights reserved.
//

#import "ViewController.h"
#import "ExampleTextInputFormObject.h"
#import "SpacerFormObject.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [super setFormObjects:@[
                            [[SpacerFormObject alloc] initWithOnSelected:nil],
                            [[ExampleTextInputFormObject alloc] initWithPlaceholder:@"Field #1" onChanged:^(NSString *text) {
        NSLog(@"field 1 value changed: %@", text);
    }],
                            [[ExampleTextInputFormObject alloc] initWithPlaceholder:@"Field #2" onChanged:^(NSString *text) {
        NSLog(@"field 2 value changed: %@", text);
    }],
                            [[ExampleTextInputFormObject alloc] initWithPlaceholder:@"Field #3" onChanged:^(NSString *text) {
        NSLog(@"field 3 value changed: %@", text);
    }],
                            [[ExampleTextInputFormObject alloc] initWithPlaceholder:@"Field #4" onChanged:^(NSString *text) {
        NSLog(@"field 4 value changed: %@", text);
    }]]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
}

+ (UIColor *)getBackgroundColor {
    return [UIColor blackColor];
}

+ (UIColor *)getInactiveColor {
    return [UIColor darkGrayColor];
}

+ (UIColor *)foregroundColor {
    return [UIColor whiteColor];
}

@end
