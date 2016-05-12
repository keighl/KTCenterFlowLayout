//
//  KTSwiftCollectionViewController.swift
//  CenterFlow
//
//  Created by Parsons, Rachel on 5/11/16.
//  Copyright © 2016 keighl. All rights reserved.
//

import UIKit

class KTSwiftCollectionViewController: UICollectionViewController { 
    
    var states = [AnyObject]()
    var sizingCell: KTAwesomeCell!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.title = "Swift Center Layout"
        self.collectionView?.backgroundColor = .lightGrayColor()

        if let layout = collectionView?.collectionViewLayout as? CustomCenterFlowLayout {
            layout.minimumInteritemSpacing = 15.0
            layout.minimumLineSpacing = 15.0
            layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
            layout.estimatedItemSize = CGSize(width: 100.0, height: 50.0)
        }
        
        collectionView?.registerClass(KTAwesomeSizingCell.self, forCellWithReuseIdentifier: "AwesomeCell")
        
        sizingCell = KTAwesomeCell()
        states = Constants.states()
    }
    
    // MARK: - UICollectionView DataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return states.count
    }
    
    // MARK: - UIColllectionViewDelegate
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("AwesomeCell", forIndexPath: indexPath)
        
        if let theCell = cell as? KTAwesomeSizingCell {
            theCell.label.text = self.states[indexPath.row] as? String
        }
        return cell
    }
    
    // MARK: - DelegateFlowLayout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        var size: CGSize
        if let state = self.states[indexPath.row] as? String {
            self.sizingCell.label.text = state
            self.sizingCell.sizeToFit()
            size = self.sizingCell.intrinsicContentSize()
            if size.width < 0 || size.height < 0 {
                size = CGSize(width: 50, height: 50)
            }
        } else {
            size = CGSize(width: 50, height: 50)
        }
        
        return size
    }

}
