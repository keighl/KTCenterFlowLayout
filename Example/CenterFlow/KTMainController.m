//
//  MainController.m
//  CenterFlow
//
//  Created by Kyle Truscott on 10/9/14.
//  Copyright (c) 2014 keighl. All rights reserved.
//

#import "KTMainController.h"
#import "KTCenterFlowLayout.h"
#import "KTAwesomeCell.h"

@interface KTMainController ()
@property (strong) NSArray *states;
@property (strong) KTAwesomeCell *sizingCell;
@end

@implementation KTMainController

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  self.title = @"KTCenterFlowLayout";
  
  self.collectionView.backgroundColor = [UIColor whiteColor];
  
  [(KTCenterFlowLayout *)self.collectionViewLayout setMinimumInteritemSpacing:10.f];
  [(KTCenterFlowLayout *)self.collectionViewLayout setMinimumLineSpacing:10.f];
  [(KTCenterFlowLayout *)self.collectionViewLayout setSectionInset:UIEdgeInsetsMake(20, 20, 20, 20)];
  
  [self.collectionView registerClass:[KTAwesomeCell class] forCellWithReuseIdentifier:@"AwesomeCell"];
  
  self.sizingCell = [KTAwesomeCell new];
  
  self.states = @[
                  @"Alabama",
                  @"Alaska",
                  @"Arizona",
                  @"Arkansas",
                  @"California",
                  @"Colorado",
                  @"Connecticut",
                  @"Delaware",
                  @"District Of Columbia",
                  @"Florida",
                  @"Georgia",
                  @"Hawaii",
                  @"Idaho",
                  @"Illinois",
                  @"Indiana",
                  @"Iowa",
                  @"Kansas",
                  @"Kentucky",
                  @"Louisiana",
                  @"Maine",
                  @"Maryland",
                  @"Massachusetts",
                  @"Michigan",
                  @"Minnesota",
                  @"Mississippi",
                  @"Missouri",
                  @"Montana",
                  @"Nebraska",
                  @"Nevada",
                  @"New Hampshire",
                  @"New Jersey",
                  @"New Mexico",
                  @"New York",
                  @"North Carolina",
                  @"North Dakota",
                  @"Ohio",
                  @"Oklahoma",
                  @"Oregon",
                  @"Pennsylvania",
                  @"Rhode Island",
                  @"South Carolina",
                  @"South Dakota",
                  @"Tennessee",
                  @"Texas",
                  @"Utah",
                  @"Vermont",
                  @"Virginia",
                  @"Washington",
                  @"West Virginia",
                  @"Wisconsin",
                  @"Wyoming"
                  ];
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
  
  cell.label.text = self.states[indexPath.row];
  return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewFlowLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
  self.sizingCell.label.text = self.states[indexPath.row];
  [self.sizingCell setNeedsLayout];
  [self.sizingCell layoutIfNeeded];
  return self.sizingCell.intrinsicContentSize;
}

@end
