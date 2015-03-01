//
//  DTBaseIcon.m
//  DTFormViewController
//
//  Created by Daniel Thengvall on 2/28/15.
//  Copyright (c) 2015 DTHENG. All rights reserved.
//

#import "DTBaseIcon.h"

@implementation DTBaseIcon

- (id)initWithColors:(UIColor *)background foreground:(UIColor *)foreground frame:(CGRect)frame {
    _background = background;
    _foreground = foreground;
    return [super initWithFrame: frame];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    if ( ! _background) {
        _background = [UIColor whiteColor];
    }
    if ( ! _foreground) {
        _foreground = [UIColor blackColor];
    }
    
    _smallRadius = 3;
    _largeRadius = _smallRadius * 2;
}

@end
