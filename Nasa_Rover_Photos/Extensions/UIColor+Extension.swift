//
//  UIColor+Extension.swift
//  Nasa_Rover_Photos
//
//  Created by Burak Erarslan on 28.11.2020.
//

import UIKit
import UIModule

// MARK: - Custom Colors
extension UIColor {
    
    public class var firstWhiteColor:UIColor {
        return UIColor(hex: "D0D0D0")
    }
    
    public class var firstBrownColor:UIColor {
        return UIColor(hex: "80271c")
    }
    
    public class var firstBlackColor:UIColor {
        return UIColor(hex: "303030")
    }
    
    public class var firstRedColor:UIColor {
        return UIColor(hex: "FF1257")
    }
}

// MARK: - DarkMode and LightMode Automation Colors
extension UIColor {
    
    public class var detailPopupColor:UIColor {
        return UIColor(light: .firstWhiteColor, dark: .brown)
    }

    public class var filterPopupColor:UIColor {
        return UIColor(light: .white, dark: .firstBlackColor)
    }
    
    public class var filterListSeparatorColor:UIColor {
        return UIColor(light: .lightGray, dark: .white)
    }
    
    public class var filterNavigationItemColor:UIColor {
        return UIColor(light: .darkGray, dark: .lightGray)
    }
    
    public class var filterApplyButtonColor:UIColor {
        return UIColor(light: .firstRedColor, dark: .firstBrownColor)
    }
    
    public class var indicatorColor:UIColor {
        return UIColor(light: .black, dark: .white)
    }
}
