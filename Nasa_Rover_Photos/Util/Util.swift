//
//  Util.swift
//  Nasa_Rover_Photos
//
//  Created by Burak Erarslan on 28.11.2020.
//

import UIKit

class Util: NSObject {
   
    class func getViewFromNib(bundle: Bundle? = nil, nibName: String) -> UIView {
        return (bundle ?? Bundle.main).loadNibNamed(nibName, owner: self, options: nil)?.first as! UIView
    }
    
    public class func fontSizeCalculator(currentSize:Int) -> CGFloat{
        
        let target = DeviceType.unknown.currentDevice()
        
        switch target {
        case .iPhone5:
            return CGFloat(currentSize - 2)
        case .iPhone678:
            return CGFloat(currentSize)
        case .iPhone678Plus,.iPhoneXsMaxXr:
            return CGFloat(currentSize + 2)
        case .iPhoneXXs:
            return CGFloat(currentSize)
        default:
            break
        }
        return 16
    }
}
