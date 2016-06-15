//
//  MainController.m
//  CenterFlow
//
//  Created by Kyle Truscott on 10/9/14.
//  Copyright (c) 2014 keighl. All rights reserved.
//

#import "KTBasicCollectionViewController.h"
#import "KTCenterFlowLayout.h"
#import "Constants.h"
#import "KTHeaderFooterView.h"

@interface KTBasicCollectionViewController ()
@end

@implementation KTBasicCollectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
  
    self.collectionView.backgroundColor = [UIColor whiteColor];
  
    [(KTCenterFlowLayout *)self.collectionViewLayout setMinimumInteritemSpacing:15.f];
    [(KTCenterFlowLayout *)self.collectionViewLayout setMinimumLineSpacing:15.f];
    [(KTCenterFlowLayout *)self.collectionViewLayout setSectionInset:UIEdgeInsetsMake(20, 20, 20, 20)];
    
    [self.collectionView registerClass:[KTHeaderFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerCellID];
    [self.collectionView registerClass:[KTHeaderFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerCellID];
    [self.collectionView registerClass:[KTAwesomeCell class] forCellWithReuseIdentifier:stateCellID];
    
    self.sizingCell = [KTAwesomeCell new];
  
    self.states = [Constants states];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.states.count;
}

#pragma mark - UICollectionViewDelegate

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    KTAwesomeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:stateCellID
                                                                    forIndexPath:indexPath];
  
    cell.label.text = self.states[indexPath.row];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader)
    {
        KTHeaderFooterView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerCellID forIndexPath:indexPath];
        header.label.text = @"50 states...";
        return header;
    }

    if (kind == UICollectionElementKindSectionFooter)
    {
        KTHeaderFooterView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:footerCellID forIndexPath:indexPath];
        header.label.text = @"...that's all of 'em.";
        return header;
    }

    return nil;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewFlowLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.sizingCell.label.text = self.states[indexPath.row];
    return self.sizingCell.intrinsicContentSize;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section;
{
    CGFloat width = collectionView.bounds.size.width;
    return CGSizeMake(width, 40);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section;
{
    CGFloat width = collectionView.bounds.size.width;
    return CGSizeMake(width, 40);
}

@end
