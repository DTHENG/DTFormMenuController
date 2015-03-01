//
//  DTPreviousIcon.m
//  DTFormViewController
//
//  Created by Daniel Thengvall on 2/28/15.
//  Copyright (c) 2015 DTHENG. All rights reserved.
//

#import "DTPreviousIcon.h"

@implementation DTPreviousIcon

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGContextRef previous = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(previous, 14.52, 3.25);
    CGContextAddLineToPoint(previous, 15.21, 3.96);
    CGContextAddLineToPoint(previous, 7.61, 11.68);
    CGContextAddLineToPoint(previous, 14.87, 19.04);
    CGContextAddLineToPoint(previous, 14.17, 19.75);
    CGContextAddLineToPoint(previous, 6.22, 11.68);
    CGContextAddLineToPoint(previous, 14.52, 3.25);
    CGContextSetFillColorWithColor(previous, [super.foreground CGColor]);
    CGContextFillPath(previous);
}

@end
