//
//  UIView+Extension.swift
//  UIModule
//
//  Created by Burak Erarslan on 1.12.2020.
//

import UIKit

extension UIView {
    public func circle() {
        self.cornerRadius(for: frame.height / 2)
    }
    
    public func cornerRadius(for radius:CGFloat) {
        DispatchQueue.main.async {
            self.clipsToBounds = true
            self.layer.cornerRadius = radius
        }
    }
    
    public func border(color: UIColor, width: CGFloat) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
    
    public func show() {
        self.alpha = 0
        UIView.animate(withDuration: 0.4) {
            self.alpha = 1.0
        }
    }
    
    public func removeView(){
        UIView.animate(withDuration: 0.4, animations: {
            self.alpha = 0
        }, completion: { [weak self] (isSucces) in
            guard let self = self else {return}
            self.removeFromSuperview()
        })
    }
}
