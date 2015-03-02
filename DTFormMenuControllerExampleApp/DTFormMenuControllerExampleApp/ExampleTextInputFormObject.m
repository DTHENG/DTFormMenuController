//
//  ExampleTextInputFormObject.m
//  DTFormMenuControllerExampleApp
//
//  Created by Daniel Thengvall on 3/1/15.
//  Copyright (c) 2015 DTHENG. All rights reserved.
//

#import "ExampleTextInputFormObject.h"

@implementation ExampleTextInputFormObject {
    NSString *placeholder;
    void (^onChanged)(NSString *);
    void (^onSelected)(NSUInteger);
    UITextField *field;
}

- (UICollectionViewCell *)toCollectionViewCell:(UICollectionView *)collectionView :(NSIndexPath *)indexPath {
    
    UICollectionViewCell *textInputCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"textField" forIndexPath:indexPath];
    
    field = (UITextField *)[textInputCell viewWithTag:1];
    
    [field addTarget:self action:@selector(onTextFieldChanged:) forControlEvents:UIControlEventEditingChanged];
    [field addTarget:self action:@selector(onTextFieldSelected:) forControlEvents:UIControlEventEditingDidBegin];

    if (placeholder) {
        field.placeholder = placeholder;
    }
    
    return textInputCell;
}

- (void)onTextFieldChanged:(UITextField *)textField {
    if (onChanged) {
        onChanged(textField.text);
    }
}

- (void)onTextFieldSelected:(UITextField *)textField {
    if (onSelected) {
        onSelected(0);
    }
}

- (float)getHeight {
    return 40.f;
}

- (NSUInteger)numInputFields {
    return 1;
}

- (void)selectInputField:(NSUInteger)index {
    [field becomeFirstResponder];
}

- (void)selectedInputField:(void (^)(NSUInteger index))onSelectedBehavior {
    onSelected = onSelectedBehavior;
}

- (BOOL)inputSelected:(NSUInteger)index {
    return field.isFirstResponder;
}

- (ExampleTextInputFormObject *)initWithPlaceholder:(NSString *)placeholderText onChanged:(void (^)(NSString *text))onChangedBehavior {
    
    placeholder = placeholderText;
    onChanged = onChangedBehavior;
    
    return self;
}

@end
