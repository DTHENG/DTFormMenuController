//
//  DTFormViewController.m
//  DTFormViewController
//
//  Created by Daniel Thengvall on 2/28/15.
//  Copyright (c) 2015 DTHENG. All rights reserved.
//

#import "DTFormViewController.h"
#import "DTFormMenuViewController.h"
#import "DTFormMenuViewDelegate.h"
#import "DTBaseFormObject.h"

@interface DTFormViewController () <DTFormMenuViewDelegate>

@end

@implementation DTFormViewController {
    DTFormMenuViewController *formMenu;
    NSArray *objects;
    BOOL hasFormMenu;
}


#pragma mark - UICollectionViewCell

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self registerForKeyboardNotifications];
}

- (void)setFormObjects:(NSArray *)formObjects {
    objects = formObjects;
    
    [self onObjectsReady];
}

- (void)onObjectsReady {
    for (NSUInteger i = 0; i < objects.count; i++) {
        if ([objects[i] numInputFields] > 0) {
            [objects[i] selectedInputField:^(int index) {
                if (formMenu) {
                    [formMenu.collectionView reloadData];
                }
            }];
        }
    }
    
    if ([self numberOfInputsInForm] > 1) {
        formMenu = (DTFormMenuViewController *)[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"DTFormMenuViewController"];
        formMenu.delegate = self;
        [self.view addSubview:formMenu.view];
        hasFormMenu = YES;
    }
}

- (void)onDefaultFieldSelected:(UITextField *)field {
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    DTBaseFormObject *object = [self getObject:indexPath.row];
    object.getCellSelectedBehavior();
    [self.view endEditing:YES];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return objects.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    DTBaseFormObject *object = [self getObject:indexPath.row];
    return CGSizeMake(self.view.bounds.size.width, [object getHeight]);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DTBaseFormObject *object = [self getObject:indexPath.row];
    
    if (indexPath.row == objects.count) {
        [self onObjectsReady];
    }
    return [object toCollectionViewCell:collectionView :indexPath];
}

- (DTBaseFormObject *)getObject:(NSInteger)index {
    return objects[(NSUInteger)index];
}

- (void)registerForKeyboardNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWasShown:(NSNotification*)aNotification {
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [info[UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height + (hasFormMenu ? 50 : 0), 0.0);
    self.collectionView.contentInset = contentInsets;
    self.collectionView.scrollIndicatorInsets = contentInsets;
}

- (void)keyboardWillBeHidden:(NSNotification*)aNotification {
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.collectionView.contentInset = contentInsets;
    self.collectionView.scrollIndicatorInsets = contentInsets;
}


#pragma mark - FormMenuViewDelegate

- (BOOL)formMenuView:(id)sender selectable:(int)button {
    
    NSIndexPath *activeInputField = [self getPositionOfSelectedInputField];
    
    switch (button) {
        case 0:
            return [self inputsBeforePosition:activeInputField];
        default:
            return [self inputsAfterPosition:activeInputField];
    }
}

- (void)formMenuView:(id)sender selected:(int)button {
    
    NSIndexPath *activeInputField = [self getPositionOfSelectedInputField];
    
    switch (button) {
        case 0:
            if ([self inputsBeforePosition:activeInputField]) {
                [self selectPreviousTextField:activeInputField];
            }
            break;
        default:
            if ([self inputsAfterPosition:activeInputField]) {
                [self selectNextTextField:activeInputField];
            }
            break;
    }
}

- (UIColor *)formMenuView:(id)sender foregroundColor:(float)alpha {
	return [self getForegroundColor];
}

- (UIColor *)formMenuView:(id)sender inactiveColor:(float)alpha {
	return [self getInactiveColor];
}

- (UIColor *)formMenuView:(id)sender backgroundColor:(float)alpha {
	return [self getBackgroundColor];
}

- (UIColor *)getBackgroundColor {
	return [UIColor whiteColor];
}

- (UIColor *)getInactiveColor {
	return [UIColor lightGrayColor];
}

- (UIColor *)getForegroundColor {
	return [UIColor blackColor];
}

- (NSIndexPath *)getPositionOfSelectedInputField {
    for (NSUInteger i = 0; i < objects.count; i++) {
        if ([objects[i] numInputFields] > 0) {
            for (NSUInteger j = 0; j < [objects[i] numInputFields]; j++) {
                if ([objects[i] inputSelected:j]) {
                    return [NSIndexPath indexPathForRow:j inSection:i];
                }
            }
        }
    }
    return nil;
}

- (NSIndexPath *)indexOfInputAfterPosition:(NSIndexPath *)p {
    if ( ! p) {
        return nil;
    }
    NSUInteger s = (NSUInteger)p.section;
    NSUInteger r = (NSUInteger)p.row;
    for (NSUInteger i = s; i < objects.count; ++i) {
        for (NSUInteger j = i == p.section ? r+1 : 0; j < [objects[i] numInputFields];) {
            return [NSIndexPath indexPathForRow:j inSection:i];
        }
    }
    return nil;
}

- (NSIndexPath *)indexOfInputBeforePosition:(NSIndexPath *)p {
    if ( ! p) {
        return nil;
    }
    NSUInteger s = (NSUInteger)p.section;
    NSUInteger r = (NSUInteger)p.row;
    for (NSUInteger i = s; i > 0; --i) {
        for (NSUInteger j = i == s ? r : [objects[i-1] numInputFields]; j > 0;) {
            return [NSIndexPath indexPathForRow:j-1 inSection:i - (i == s ? 0 : 1)];
        }
    }
    return nil;
}

- (BOOL)inputsAfterPosition:(NSIndexPath *)position {
    NSIndexPath *path = [self indexOfInputAfterPosition:position];
    return path != nil;
}

- (BOOL)inputsBeforePosition:(NSIndexPath *)position {
    NSIndexPath *path = [self indexOfInputBeforePosition:position];
    return path != nil;
}

- (void)selectNextTextField:(NSIndexPath *)position {
    NSIndexPath *path = [self indexOfInputAfterPosition:position];
    if (path) {
        [objects[(NSUInteger)path.section] selectInputField:path.row];
    }
}

- (void)selectPreviousTextField:(NSIndexPath *)position {
    NSIndexPath *path = [self indexOfInputBeforePosition:position];
    if (path) {
        [objects[(NSUInteger)path.section] selectInputField:path.row];
    }
}

- (int)numberOfInputsInForm {
    int count = 0;
    for (NSUInteger i = 0; i < objects.count; i++) {
        count += [objects[i] numInputFields];
    }
    return count;
}

@end
