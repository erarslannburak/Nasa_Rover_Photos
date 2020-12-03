//
//  UIView+Extension.swift
//  Nasa_Rover_Photos
//
//  Created by Burak Erarslan on 28.11.2020.
//

import Foundation
import UIKit
import BaseModule
import NVActivityIndicatorView


extension UIView {
    
    func showLoading() {
        
        for view in self.subviews {
            if view is NVActivityIndicatorView {
                return
            }
        }
        
        let frame = CGRect(x: self.frame.width/2 - 25, y: self.frame.height/2 - 25, width: 50, height: 50)
        let indicator = NVActivityIndicatorView(frame: frame, type: .ballSpinFadeLoader, color: .indicatorColor, padding: 8)
        indicator.startAnimating()
        self.addSubview(indicator)
    }
    
    func hideLoading() {
        for view in self.subviews {
            if view is NVActivityIndicatorView {
                DispatchQueue.main.async {
                    view.removeFromSuperview()
                }
            }
        }
    }
    
    func addAlert(alertVM:AlertViewModel) {
        guard let alertView = Util.getViewFromNib(nibName: "AlertView") as? AlertView else {return}
        alertView.frame = self.bounds
        alertView.configure(alertVM: alertVM)
        self.addSubview(alertView)
    }
    
    func removeAlert() {
        for view in self.subviews {
            if view is AlertView {
                DispatchQueue.main.async {
                    view.removeFromSuperview()
                }
            }
        }
    }
}
