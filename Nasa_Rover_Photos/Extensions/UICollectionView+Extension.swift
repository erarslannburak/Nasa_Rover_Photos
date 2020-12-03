//
//  UICollectionView+Extension.swift
//  Nasa_Rover_Photos
//
//  Created by Burak Erarslan on 27.11.2020.
//

import UIKit

extension UICollectionView {
    
    func registerPhotoCell() {
        register(UINib(nibName: "PhotoCollectionCell", bundle: Bundle.main), forCellWithReuseIdentifier: "photoCell")
    }
    
    func enableFullScreenPaging() {
        let scaleLayout = CustomScaleFlowLayout()
        scaleLayout.transformScale = 0.5
        scaleLayout.minimumLineSpacing = Constants.LIST_LINE_SPACING
        scaleLayout.minimumInteritemSpacing = 0
        scaleLayout.itemSize = CGSize(width: self.frame.width, height: self.frame.height)
        scaleLayout.isPagingEnabled = true
        scaleLayout.scrollDirection = .horizontal

        self.collectionViewLayout = scaleLayout
    }
}
