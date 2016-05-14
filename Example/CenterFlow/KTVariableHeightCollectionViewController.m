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
@property (strong) NSArray *states;
@property (strong) KTAwesomeCell *sizingCell;
@end

@implementation KTVariableHeightCollectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [(KTCenterFlowLayout *)self.collectionViewLayout setMinimumInteritemSpacing:15.f];
    [(KTCenterFlowLayout *)self.collectionViewLayout setMinimumLineSpacing:15.f];
    [(KTCenterFlowLayout *)self.collectionViewLayout setSectionInset:UIEdgeInsetsMake(20, 20, 20, 20)];
    
    [self.collectionView registerClass:[KTAwesomeCell class] forCellWithReuseIdentifier:@"AwesomeCell"];
    
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
    KTAwesomeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AwesomeCell"
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
