//
//  PhotoCollectionCell.swift
//  Nasa_Rover_Photos
//
//  Created by Burak Erarslan on 27.11.2020.
//

import UIKit
import BaseModule
import Kingfisher

class PhotoCollectionCell: UICollectionViewCell {

    @IBOutlet weak var imageView:UIImageView!

    func configure(_ item:PhotoViewModel) {
        setupUI()
        self.imageView.kf.setImage(with: URL(string:item.image),placeholder: "placeholder".image())
    }
    
    func setupUI(){
        self.imageView.tintColor = UIColor(light: UIColor.darkGray.withAlphaComponent(0.7), dark: UIColor.white.withAlphaComponent(0.7))
    }
}
