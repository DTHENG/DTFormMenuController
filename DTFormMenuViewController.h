//
//  DTFormMenuViewController.h
//  DTFormViewController
//
//  Created by Daniel Thengvall on 2/28/15.
//  Copyright (c) 2015 DTHENG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTFormMenuViewDelegate.h"

@interface DTFormMenuViewController : UICollectionViewController

@property (nonatomic, assign) id<DTFormMenuViewDelegate> delegate;

@end
