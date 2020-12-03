//
//  UICollectionView+Extension.swift
//  UIModule
//
//  Created by Burak Erarslan on 1.12.2020.
//

import UIKit

extension UICollectionView {
    public func reload() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
    
    public func isLastRow(indexPath: IndexPath,dataCount:Int = 0) -> Bool {
        
        let visibleCells: [IndexPath] = indexPathsForVisibleItems
        
        let lastRowIndexPath = IndexPath(row: numberOfItems(inSection: indexPath.section) - 1, section: indexPath.section)
        
        if visibleCells.contains(lastRowIndexPath) || indexPath.row == (dataCount-1) {
            return true
        }else{
            return false
        }
    }
}
