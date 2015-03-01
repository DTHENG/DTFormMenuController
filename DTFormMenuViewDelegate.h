//
//  DTFormMenuViewDelegate.h
//  DTFormViewController
//
//  Created by Daniel Thengvall on 2/28/15.
//  Copyright (c) 2015 DTHENG. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DTFormMenuViewDelegate <NSObject>

@required
- (BOOL)formMenuView:(id)sender selectable:(int)button;
- (void)formMenuView:(id)sender selected:(int)button;

@end