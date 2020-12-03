//
//  AlertView.swift
//  Nasa_Rover_Photos
//
//  Created by Burak Erarslan on 28.11.2020.
//

import UIKit
import BaseModule

class AlertView: UIView {

    @IBOutlet weak var imageView:UIImageView!
    @IBOutlet weak var errorTitle:UILabel!
    @IBOutlet weak var errorMessage:UILabel!
    @IBOutlet weak var containerView:UIView!
    
    func configure(alertVM:AlertViewModel) {
        self.containerView.backgroundColor = alertVM.bgColor
        self.errorTitle.attributedText = alertVM.title.attributed(font: .alertTitleFont,color: .white,alignment: .center)
        self.errorMessage.attributedText = alertVM.message.attributed(font: .filterTitleFont,color: .white,alignment: .center)
        imageView.image = alertVM.image
        
        setupUI()
    }
    
    func setupUI() {
        self.containerView.cornerRadius(for: 8)
    }
}
