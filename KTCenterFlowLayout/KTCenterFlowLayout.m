//
//  KTCenterFlowLayout.m
//
//  Created by Kyle Truscott on 10/9/14.
//  Copyright (c) 2014 keighl. All rights reserved.
//

#import "KTCenterFlowLayout.h"

@interface KTCenterFlowLayout ()
@property (nonatomic) NSMutableDictionary *attrCache;
@end

@implementation KTCenterFlowLayout

- (void)prepareLayout
{
    // Clear the attrCache
    self.attrCache = [NSMutableDictionary new];
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *updatedAttributes = [NSMutableArray new];

    NSInteger sections = [self.collectionView numberOfSections];
    NSInteger s = 0;
    while (s < sections)
    {
        NSInteger rows = [self.collectionView numberOfItemsInSection:s];
        NSInteger r = 0;
        while (r < rows)
        {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:r inSection:s];

            UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
            
            if (attrs && CGRectIntersectsRect(attrs.frame, rect))
            {
                [updatedAttributes addObject:attrs];
            }

            UICollectionViewLayoutAttributes *headerAttrs =  [super layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                                                                   atIndexPath:indexPath];

            if (headerAttrs && CGRectIntersectsRect(headerAttrs.frame, rect))
            {
                [updatedAttributes addObject:headerAttrs];
            }

            UICollectionViewLayoutAttributes *footerAttrs =  [super layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionFooter
                                                                                                   atIndexPath:indexPath];

            if (footerAttrs && CGRectIntersectsRect(footerAttrs.frame, rect))
            {
                [updatedAttributes addObject:footerAttrs];
            }

            r++;
        }
        s++;
    }

    return updatedAttributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.attrCache[indexPath])
    {
        return self.attrCache[indexPath];
    }

    // Find the other items in the same "row"
    NSMutableArray *rowBuddies = [NSMutableArray new];

    // Calculate the available width to center stuff within
    // sectionInset is NOT applicable here because a) we're centering stuff
    // and b) Flow layout has arranged the cells to respect the inset. We're
    // just hijacking the X position.
    CGFloat collectionViewWidth = CGRectGetWidth(self.collectionView.bounds) -
        self.collectionView.contentInset.left -
        self.collectionView.contentInset.right;

    // To find other items in the "row", we need a rect to check intersects against.
    // Take the item attributes frame (from vanilla flow layout), and stretch it out
    CGRect rowTestFrame = [super layoutAttributesForItemAtIndexPath:indexPath].frame;
    rowTestFrame.origin.x = 0;
    rowTestFrame.size.width = collectionViewWidth;

    NSInteger totalRows = [self.collectionView numberOfItemsInSection:indexPath.section];

    // From this item, work backwards to find the first item in the row
    // Decrement the row index until a) we get to 0, b) we reach a previous row
    NSInteger rowStartIDX = indexPath.row;
    while (true)
    {
        NSInteger prevIDX = rowStartIDX - 1;

        if (prevIDX < 0)
        {
            break;
        }

        NSIndexPath *prevPath = [NSIndexPath indexPathForRow:prevIDX inSection:indexPath.section];
        CGRect prevFrame = [super layoutAttributesForItemAtIndexPath:prevPath].frame;

        // If the item intersects the test frame, it's in the same row
        if (CGRectIntersectsRect(prevFrame, rowTestFrame))
            rowStartIDX = prevIDX;
        else
            // Found previous row, escape!
            break;
    }

    // Now, work back UP to find the last item in the row
    // For each item in the row, add it's attributes to rowBuddies
    NSInteger buddyIDX = rowStartIDX;
    while (true)
    {
        if (buddyIDX > (totalRows-1))
        {
            break;
        }

        NSIndexPath *buddyPath = [NSIndexPath indexPathForRow:buddyIDX inSection:indexPath.section];

        UICollectionViewLayoutAttributes *buddyAttributes = [super layoutAttributesForItemAtIndexPath:buddyPath];

        if (CGRectIntersectsRect(buddyAttributes.frame, rowTestFrame))
        {
            // If the item intersects the test frame, it's in the same row
            [rowBuddies addObject:[buddyAttributes copy]];
            buddyIDX++;
        }
        else
        {
            // Encountered next row
            break;
        }
    }

    id <UICollectionViewDelegateFlowLayout> flowDelegate = (id<UICollectionViewDelegateFlowLayout>) [[self collectionView] delegate];
    BOOL delegateSupportsInteritemSpacing = [flowDelegate respondsToSelector:@selector(collectionView:layout:minimumInteritemSpacingForSectionAtIndex:)];

    // x-x-x-x ... sum up the interim space
    CGFloat interitemSpacing = [self minimumInteritemSpacing];

    // Check for minimumInteritemSpacingForSectionAtIndex support
    if (delegateSupportsInteritemSpacing && rowBuddies.count > 0)
    {
        interitemSpacing = [flowDelegate collectionView:self.collectionView
                                                 layout:self
               minimumInteritemSpacingForSectionAtIndex:indexPath.section];
    }

    CGFloat aggregateInteritemSpacing = interitemSpacing * (rowBuddies.count -1);

    // Sum the width of all elements in the row
    CGFloat aggregateItemWidths = 0.f;
    for (UICollectionViewLayoutAttributes *itemAttributes in rowBuddies)
        aggregateItemWidths += CGRectGetWidth(itemAttributes.frame);

    // Build an alignment rect
    // |  |x-x-x-x|  |
    CGFloat alignmentWidth = aggregateItemWidths + aggregateInteritemSpacing;
    CGFloat alignmentXOffset = (collectionViewWidth - alignmentWidth) / 2.f;

    // Adjust each item's position to be centered
    CGRect previousFrame = CGRectZero;
    for (UICollectionViewLayoutAttributes *itemAttributes in rowBuddies)
    {
        CGRect itemFrame = itemAttributes.frame;

        if (CGRectEqualToRect(previousFrame, CGRectZero))
            itemFrame.origin.x = alignmentXOffset;
        else
            itemFrame.origin.x = CGRectGetMaxX(previousFrame) + interitemSpacing;

        itemAttributes.frame = itemFrame;
        previousFrame = itemFrame;

        // Finally, add it to the cache
        self.attrCache[itemAttributes.indexPath] = itemAttributes;
    }

    return self.attrCache[indexPath];
}

@end
