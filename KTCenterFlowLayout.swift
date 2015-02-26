//
//  KTCenterFlowLayout.swift
//  Name It
//
//  Created by Ivan Dilchovski on 2/26/15.
//  Copyright (c) 2015 Ivan Dilchovski. All rights reserved.
//

import UIKit

class KTCenterFlowLayout: UICollectionViewFlowLayout
{
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]?
    {
        let superAttributes = super.layoutAttributesForElementsInRect(rect)
        var rowCollections = [CGFloat : [UICollectionViewLayoutAttributes]]()
        
        // Collect attributes by their midY coordinate.. i.e. rows!
        if let superAttributes = superAttributes
        {
            for attributes in superAttributes as [UICollectionViewLayoutAttributes]
            {
                let yCenter = CGRectGetMidY(attributes.frame)
                if rowCollections[yCenter] == nil
                {
                    rowCollections[yCenter] = [UICollectionViewLayoutAttributes]()
                }
                
                rowCollections[yCenter]!.append(attributes)
            }
        }
        
        // Adjust the items in each row
        for (key, itemAttributesCollection) in rowCollections
        {
            let itemsInRow = itemAttributesCollection.count
            
            // x-x-x-x ... sum up the interim space
            let aggregateInteritemSpacing = self.minimumInteritemSpacing * CGFloat((itemsInRow - 1))
            
            // Sum the width of all elements in the row
            var aggregateItemWidths: CGFloat = 0;
            for itemAttributes in itemAttributesCollection
            {
                aggregateItemWidths += CGRectGetWidth(itemAttributes.frame)
            }
            
            // Build an alignment rect
            // |==|--------|==|
            let alignmentWidth = aggregateItemWidths + aggregateInteritemSpacing
            let alignmentXOffset = (CGRectGetWidth(rect) - alignmentWidth) / 2
            
            // Adjust each item's position to be centered
            var previousFrame = CGRectZero
            for itemAttributes in itemAttributesCollection
            {
                var itemFrame = itemAttributes.frame
                if CGRectEqualToRect(previousFrame, CGRectZero)
                {
                    itemFrame.origin.x = alignmentXOffset
                } else
                {
                    itemFrame.origin.x = CGRectGetMaxX(previousFrame) + self.minimumInteritemSpacing
                }
                
                itemAttributes.frame = itemFrame
                previousFrame = itemFrame
            }
        }
        
        return superAttributes
    }
}
