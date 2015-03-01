//
//  SpacerFormObject.m
//  DTFormMenuControllerExampleApp
//
//  Created by Daniel Thengvall on 3/1/15.
//  Copyright (c) 2015 DTHENG. All rights reserved.
//

#import "SpacerFormObject.h"

@implementation SpacerFormObject

- (UICollectionViewCell *)toCollectionViewCell:(UICollectionView *)collectionView :(NSIndexPath *)indexPath {
    return [collectionView dequeueReusableCellWithReuseIdentifier:@"blank" forIndexPath:indexPath];
}

- (float)getHeight {
    return 15.f;
}

@end
