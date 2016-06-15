//
//  KTSelfSizingCollectionViewController.m
//  CenterFlow
//
//  Created by Kyle Truscott on 5/3/16.
//  Copyright © 2016 keighl. All rights reserved.
//

#import "KTSelfSizingCollectionViewController.h"
#import "KTCenterFlowLayout.h"
#import "KTAwesomeSizingCell.h"
#import "Constants.h"

@interface KTSelfSizingCollectionViewController ()
@property (strong) NSArray *states;
@property (strong) KTAwesomeSizingCell *sizingCell;
@end

@implementation KTSelfSizingCollectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [(KTCenterFlowLayout *)self.collectionViewLayout setEstimatedItemSize:CGSizeMake(100, 50)];
    [(KTCenterFlowLayout *)self.collectionViewLayout setMinimumInteritemSpacing:15.f];
    [(KTCenterFlowLayout *)self.collectionViewLayout setMinimumLineSpacing:15.f];
    [(KTCenterFlowLayout *)self.collectionViewLayout setSectionInset:UIEdgeInsetsMake(20, 20, 20, 20)];
    
    [self.collectionView registerClass:[KTAwesomeSizingCell class] forCellWithReuseIdentifier:stateCellID];
    
    self.sizingCell = [KTAwesomeSizingCell new];
    
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
    KTAwesomeSizingCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:stateCellID
                                                                          forIndexPath:indexPath];
    
    cell.label.text = self.states[indexPath.row];
    return cell;
}

@end
