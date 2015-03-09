//
//  DTFormMenuViewDelegate.h
//  DTFormViewController
//
//  Created by Daniel Thengvall on 2/28/15.
//  Copyright (c) 2015 DTHENG. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DTFormMenuViewDelegate <NSObject>

- (UIColor *)formMenuView:(id)sender foregroundColor:(float)alpha;
- (UIColor *)formMenuView:(id)sender inactiveColor:(float)alpha;
- (UIColor *)formMenuView:(id)sender backgroundColor:(float)alpha;
- (BOOL)formMenuView:(id)sender selectable:(int)button;
- (void)formMenuView:(id)sender selected:(int)button;

@end