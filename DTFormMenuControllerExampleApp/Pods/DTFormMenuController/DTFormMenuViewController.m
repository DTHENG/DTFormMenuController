//
//  DTFormMenuViewController.m
//  DTFormViewController
//
//  Created by Daniel Thengvall on 2/28/15.
//  Copyright (c) 2015 DTHENG. All rights reserved.
//

#import "DTFormMenuViewController.h"
#import "DTPreviousIcon.h"

@implementation DTFormMenuViewController

static int height = 50;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self registerForKeyboardNotifications];
    
    self.view.hidden = YES;
    self.view.alpha = 0;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(^{
        switch (indexPath.row) {
            case 0:
            case 1:
                return (CGFloat) height;
            case 2:
                return self.view.bounds.size.width - (height * 4);
            default:
                return (CGFloat) (height * 2);
        }
    }(), height);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *content = [collectionView dequeueReusableCellWithReuseIdentifier:@"content" forIndexPath:indexPath];
    
    content.backgroundColor = [_delegate formMenuView:self backgroundColor:1.f];
    
    UIView *border = [[UIView alloc] initWithFrame:CGRectMake(0, 0, content.frame.size.width, 0.5)];
    border.backgroundColor = [_delegate formMenuView:self inactiveColor:1.f];
    [content addSubview:border];
    
    if ([content viewWithTag:2] != nil) {
        [[content viewWithTag:2] removeFromSuperview];
    }
    
    switch (indexPath.row) {
        case 0: {
            DTPreviousIcon *prev = [[DTPreviousIcon alloc] initWithColors:[UIColor whiteColor] foreground:[_delegate formMenuView:self selectable:(int) indexPath.row] ? [_delegate formMenuView:self foregroundColor:1.f] : [_delegate formMenuView:self inactiveColor:1.f] frame:CGRectMake(12, 12, 23, 23)];
            prev.backgroundColor = [UIColor clearColor];
            prev.tag = 2;
            [content addSubview:prev];
            break;
        }
        case 1: {
            DTPreviousIcon *prev = [[DTPreviousIcon alloc] initWithColors:[UIColor whiteColor] foreground:[_delegate formMenuView:self selectable:(int) indexPath.row] ? [UIColor blackColor] : [UIColor lightGrayColor] frame:CGRectMake(12, 12, 23, 23)];
            prev.backgroundColor = [UIColor clearColor];
            prev.transform = CGAffineTransformRotate(prev.transform, M_PI);
            prev.tag = 2;
            [content addSubview:prev];
            break;
        }
        default:
            break;
    }
    
    return content;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([_delegate formMenuView:self selectable:(int) indexPath.row]) {
        [_delegate formMenuView:self selected:(int) indexPath.row];
        [self.collectionView reloadData];
    }
}

- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWasShown:(NSNotification*)aNotification {
    
    self.view.hidden = NO;
    
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [info[UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    self.view.frame = CGRectMake(0, [self.view superview].frame.size.height - kbSize.height - (height / 2), self.view.bounds.size.width, height);
    
    [UIView animateWithDuration:0.4 animations:^{
        self.view.alpha = 1;
    }];
    
    [UIView animateWithDuration:0.25 animations:^{
        self.view.frame = CGRectMake(0, [self.view superview].frame.size.height - kbSize.height - self.view.frame.size.height, self.view.bounds.size.width, height);
    }];
}

- (void)keyboardWillBeHidden:(NSNotification*)aNotification {
    
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [info[UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    [UIView animateWithDuration:0.2 animations:^{
        
        self.view.alpha = 0;
        self.view.frame = CGRectMake(0, [self.view superview].frame.size.height - kbSize.height, self.view.bounds.size.width, height);
        
    } completion:^(BOOL finished) {
        
        if (finished) {
            self.view.hidden = YES;
        }
    }];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [self.view removeFromSuperview];
}

@end
