//
//  DTBaseFormObject.h
//  DTFormViewController
//
//  Created by Daniel Thengvall on 2/28/15.
//  Copyright (c) 2015 DTHENG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DTBaseFormObject : NSObject

- (UICollectionViewCell *)toCollectionViewCell:(UICollectionView *)collectionView :(NSIndexPath *)indexPath;
- (float)getHeight;
- (NSUInteger)numInputFields;
- (void)selectInputField:(NSUInteger)index;
- (void)selectedInputField:(void (^)(NSUInteger index))onSelected;
- (BOOL)inputSelected:(NSUInteger)index;
- (void (^)())getCellSelectedBehavior;

- (DTBaseFormObject *)initWithOnSelected:(void (^)())onSelected;

@end
