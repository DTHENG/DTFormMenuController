//
//  DTBaseIcon.h
//  DTFormViewController
//
//  Created by Daniel Thengvall on 2/28/15.
//  Copyright (c) 2015 DTHENG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DTBaseIcon : UIView

@property UIColor *background, *foreground;
@property int smallRadius, largeRadius;

- (id)initWithColors:(UIColor *)background
          foreground:(UIColor *)foreground
               frame:(CGRect)frame;

@end
