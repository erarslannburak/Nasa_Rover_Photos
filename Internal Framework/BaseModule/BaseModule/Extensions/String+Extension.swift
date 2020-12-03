//
//  String+Extension.swift
//  BaseModule
//
//  Created by Burak Erarslan on 1.12.2020.
//

import Foundation
import UIKit

extension String {
    
    public func attributed(font: UIFont,color: UIColor = .black, letterSpace: CGFloat? = nil, lineSpace: CGFloat? = nil, alignment: NSTextAlignment = .natural) -> NSAttributedString {
        let allAttributedString = NSMutableAttributedString(string: self)
        let allRange = (self as NSString).range(of: self)
        
        var attributes: [NSAttributedString.Key : Any] = [NSAttributedString.Key.font: font,
                          NSAttributedString.Key.foregroundColor: color]
        
        if let letterSpacing = letterSpace {
            attributes[NSAttributedString.Key.kern] = letterSpacing
        }
        
        let paragraphStyle = NSMutableParagraphStyle()
        if let lineSpacing = lineSpace {
            paragraphStyle.lineSpacing = lineSpacing
        }
        paragraphStyle.lineBreakMode = .byTruncatingTail
        paragraphStyle.alignment = alignment
        attributes[NSAttributedString.Key.paragraphStyle] = paragraphStyle
        
        allAttributedString.addAttributes(attributes, range: allRange)
        
        return allAttributedString
    }
    
    public func localized(bundle: Bundle? = nil) -> String {
        return LanguageManager.localized(self, bundle: bundle)
    }
    
    public func image() -> UIImage? {
        guard let image = UIImage(named: self, in: Bundle.main, compatibleWith: nil) else {return nil}
        return image
    }
}
