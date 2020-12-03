//
//  PhotoDetailView.swift
//  Nasa_Rover_Photos
//
//  Created by Burak Erarslan on 28.11.2020.
//

import UIKit
import BaseModule
import Kingfisher

class PhotoDetailView: UIView {

    @IBOutlet weak var imageView:UIImageView!
    @IBOutlet weak var dateLabel:UILabel!
    @IBOutlet weak var roverLabel:UILabel!
    @IBOutlet weak var cameraLabel:UILabel!
    @IBOutlet weak var roverStatusLabel:UILabel!
    @IBOutlet weak var landingLabel:UILabel!
    @IBOutlet weak var launchLabel:UILabel!
    
    @IBOutlet weak var popupView:UIView!
    
    @IBOutlet weak var imageViewHeightConst: NSLayoutConstraint!
    
    var removeViewClosure:(() ->())?

    
    func configure(to photoVM:PhotoViewModel) {
        
        AnalyticsEventManager.sharedInstance.photoDetail.accept(photoVM)
        
        dateLabel.attributedText = "Tarih : \(photoVM.date)".attributed(font: .detailTitleFont,color:UIColor(light: .black, dark: .white))
        roverLabel.attributedText = "Araç : \(photoVM.rover.name)".attributed(font: .detailTitleFont,color:UIColor(light: .black, dark: .white))
        cameraLabel.attributedText = "Kamera : \(photoVM.camera.fullName)".attributed(font: .detailTitleFont,color:UIColor(light: .black, dark: .white))
        roverStatusLabel.attributedText = "Araç Görev Durumu : \(photoVM.rover.status.uppercased())".attributed(font: .detailTitleFont,color:UIColor(light: .black, dark: .white))
        landingLabel.attributedText = "Araç Fırlatılma Tarihi : \(photoVM.rover.landingDate)".attributed(font: .detailTitleFont,color:UIColor(light: .black, dark: .white))
        launchLabel.attributedText = "Araç İniş Tarihi : \(photoVM.rover.launchDate)".attributed(font: .detailTitleFont,color:UIColor(light: .black, dark: .white))
        
        
        self.imageView.kf.setImage(with: URL(string: photoVM.image),placeholder: "placeholder".image(),options: [.memoryCacheExpiration(.expired),.diskCacheExpiration(.expired),
            .processor(DownsamplingImageProcessor(size: self.imageView.bounds.size)),
            .scaleFactor(UIScreen.main.scale)
        ], completionHandler:  { [weak self] result in
            
            guard let self = self else {return}

            switch result {
            case .success(let value):
                let ratio = value.image.size.width / value.image.size.height
                let newHeight = self.imageView.frame.width / ratio
                DispatchQueue.main.async {
                    self.imageViewHeightConst.constant = newHeight
                    self.setNeedsUpdateConstraints()
                    self.show()
                }
            case .failure(let error):
                print(error) // The error happens
                self.show()
            }
        })
        setupUI()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self)
            
            
        if location.x <= popupView.frame.minX || location.x >= popupView.frame.maxX || location.y <= popupView.frame.minY || location.y >= popupView.frame.maxY
            {
            removeViewClosure?()
        }
    }
    
    func setupUI() {
        self.alpha = 0
        self.popupView.cornerRadius(for: 8)
        self.popupView.backgroundColor = .detailPopupColor
    }
    
    @IBAction func close(_ sender: Any) {
        removeViewClosure?()
    }
}
