//
//  UIFont+Extension.swift
//  Nasa_Rover_Photos
//
//  Created by Burak Erarslan on 28.11.2020.
//

import UIKit

extension UIFont {
    class var detailTitleFont:UIFont {
        guard let font = UIFont.init(name: "OpenSans-Regular", size: Util.fontSizeCalculator(currentSize: 15)) else {
            return UIFont.systemFont(ofSize: Util.fontSizeCalculator(currentSize: 15))
        }
        return font
    }
    
    class var filterTitleFont:UIFont {
        guard let font = UIFont.init(name: "OpenSans-Semibold", size: Util.fontSizeCalculator(currentSize: 15)) else {
            return UIFont.systemFont(ofSize: Util.fontSizeCalculator(currentSize: 15))
        }
        return font
    }
    
    class var alertTitleFont:UIFont {
        guard let font = UIFont.init(name: "OpenSans-Bold", size: Util.fontSizeCalculator(currentSize: 25)) else {
            return UIFont.systemFont(ofSize: Util.fontSizeCalculator(currentSize: 25))
        }
        return font
    }
}
