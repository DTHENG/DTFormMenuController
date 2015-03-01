//
//  DTBaseFormObject.m
//  DTFormViewController
//
//  Created by Daniel Thengvall on 2/28/15.
//  Copyright (c) 2015 DTHENG. All rights reserved.
//

#import "DTBaseFormObject.h"
#import "DTPreviousIcon.h"

@implementation DTBaseFormObject {
    void (^cellSelected)();
    UITextField *defaultInput;
}

- (UICollectionViewCell *)toCollectionViewCell:(UICollectionView *)collectionView :(NSIndexPath *)indexPath {
    return nil;
}

- (float)getHeight {
    return 55.f;
}

- (void (^)())getCellSelectedBehavior {
    return cellSelected ? cellSelected : ^{};
}

- (NSUInteger)numInputFields {
    return 0;
}

- (void)selectInputField:(int)index {
}

- (void)selectedInputField:(void (^)(int index))onSelected {
}

- (BOOL)inputSelected:(int)index {
    return NO;
}

- (DTBaseFormObject *)initWithOnSelected:(void (^)())onSelected {
    cellSelected = onSelected;
    return self;
}

@end
