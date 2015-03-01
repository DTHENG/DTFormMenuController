//
//  ExampleTextInputFormObject.h
//  DTFormMenuControllerExampleApp
//
//  Created by Daniel Thengvall on 3/1/15.
//  Copyright (c) 2015 DTHENG. All rights reserved.
//

#import "DTBaseFormObject.h"

@interface ExampleTextInputFormObject : DTBaseFormObject

- (ExampleTextInputFormObject *)initWithPlaceholder:(NSString *)placeholderText onChanged:(void (^)(NSString *text))onChangedBehavior;

@end
