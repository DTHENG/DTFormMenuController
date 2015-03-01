//
//  DTBaseFormObject.h
//  DTFormViewController
//
//  Created by Daniel Thengvall on 2/28/15.
//  Copyright (c) 2015 DTHENG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DTBaseFormObject : NSObject

- (UICollectionViewCell *)toCollectionViewCell:(UICollectionView *)collectionView :(NSIndexPath *)indexPath;
- (float)getHeight;
- (NSUInteger)numInputFields;
- (void)selectInputField:(int)index;
- (void)selectedInputField:(void (^)(int index))onSelected;
- (BOOL)inputSelected:(int)index;
- (void (^)())getCellSelectedBehavior;

- (DTBaseFormObject *)initWithOnSelected:(void (^)())onSelected;

@end
