//
//  CustomCenterFlowLayout.swift
//  CenterFlow
//
//  Created by Parsons, Rachelanne - Rachelanne on 5/10/16.
//  Copyright © 2016 keighl. All rights reserved.
//

import UIKit

class CustomerCenterFlowLayout: UICollectionViewFlowLayout {
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attributes = [UICollectionViewLayoutAttributes]()
        
        if let superAttributes = super.layoutAttributesForElementsInRect(rect) {
            attributes = superAttributes
        }

        var rowCollections = [NSNumber:[UICollectionViewLayoutAttributes]]()

        for itemAttributes in attributes {
            //normalize the midY to others in the row; with variable cell heights can be slightly different
            let midYRound = roundf(Float(CGRectGetMidY(itemAttributes.frame)))
            let midYPlus = midYRound + 1
            let midYMinus = midYRound - 1
            
            var key: NSNumber?
            
            if let _ = rowCollections[midYPlus] {
                key = midYPlus
            }
            
            if let _ = rowCollections[midYMinus] {
                key = midYMinus
            }
            
            if let _ = key { //fix this
            } else {
                key = midYRound
            }
            
            if let theKey = key  {
                if let _ = rowCollections[theKey] {
                    rowCollections[theKey]?.append(itemAttributes)
                } else {
                    var attributesArray = [UICollectionViewLayoutAttributes]()
                    attributesArray.append(itemAttributes)
                    rowCollections[theKey] = attributesArray
                }
            }
        }
        
        var collectionViewWidth: CGFloat = 0
        
        if let collectionView = self.collectionView {
            collectionViewWidth = CGRectGetWidth(collectionView.bounds) - collectionView.contentInset.left - collectionView.contentInset.right
        }
        
        for (_, itemAttributesArray) in rowCollections {
            
            let itemsInRow = itemAttributesArray.count
            var interitemSpacing = self.minimumInteritemSpacing
            
            if let theCollectionView = self.collectionView,
                let flowDelegate = theCollectionView.delegate as? UICollectionViewDelegateFlowLayout {
                    
                    let section = itemAttributesArray[0].indexPath.section
                    if let spacing = flowDelegate.collectionView?(theCollectionView, layout: self, minimumInteritemSpacingForSectionAtIndex: section)  {
                        interitemSpacing = spacing
                    }
    
            }
            
            let aggregateInteritemSpacing = interitemSpacing * CGFloat(itemsInRow-1)
            
            var aggregateItemWidths: CGFloat = 0.0
            
            for itemAttributes in itemAttributesArray {
                aggregateItemWidths += CGRectGetWidth(itemAttributes.frame)
            }
            
            let alignmentWidth = aggregateItemWidths + aggregateInteritemSpacing
            let alignmentXOffset = (collectionViewWidth - alignmentWidth) / 2.0

            var previousFrame = CGRectZero
            for itemAttributes in itemAttributesArray {
                
                var itemFrame = itemAttributes.frame
                
                if CGRectEqualToRect(previousFrame, CGRectZero) {
                    itemFrame.origin.x = alignmentXOffset
                } else {
                    itemFrame.origin.x = CGRectGetMaxX(previousFrame) + interitemSpacing
                }
                
                itemAttributes.frame = itemFrame
                previousFrame = itemFrame
            }
        }

        return attributes
    }
}







