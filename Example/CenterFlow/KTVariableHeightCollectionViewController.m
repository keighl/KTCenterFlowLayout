//
//  KTVariableHeightCollectionViewController.m
//  CenterFlow
//
//  Created by Kyle Truscott on 5/3/16.
//  Copyright © 2016 keighl. All rights reserved.
//

#import "KTVariableHeightCollectionViewController.h"
#import "KTCenterFlowLayout.h"
#import "KTAwesomeCell.h"
#import "Constants.h"

@interface KTVariableHeightCollectionViewController ()
@end

@implementation KTVariableHeightCollectionViewController

#pragma mark - UICollectionViewDelegate

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    KTAwesomeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:stateCellID
                                                                    forIndexPath:indexPath];
    
    NSString *text = self.states[indexPath.row];
    cell.label.text = text;
    cell.label.font = [self fontForText:text];
    return cell;
}


#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewFlowLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *text = self.states[indexPath.row];
    self.sizingCell.label.text = self.states[indexPath.row];
    self.sizingCell.label.font = [self fontForText:text];
    return self.sizingCell.intrinsicContentSize;
}

- (UIFont *)fontForText:(NSString *)text
{
    if (text.length == 7)
    {
        return [UIFont systemFontOfSize:16];
    }
    
    if (text.length == 8)
    {
        return [UIFont systemFontOfSize:24];
    }
    
    if (text.length == 5)
    {
        return [UIFont systemFontOfSize:10];
    }
    
    return [UIFont systemFontOfSize:14];
}

@end
