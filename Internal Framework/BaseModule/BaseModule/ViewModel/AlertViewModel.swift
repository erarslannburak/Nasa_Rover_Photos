//
//  AlertViewModel.swift
//  BaseModule
//
//  Created by Burak Erarslan on 1.12.2020.
//

import Foundation
import UIKit

public enum AlertType {
    case error
    case warning
}

public struct AlertViewModel {
    let type:AlertType
    public let message:String
}

extension AlertViewModel {
    public init(_ type:AlertType, message:String) {
        self.type = type
        self.message = message
    }
}

extension AlertViewModel {
    public var bgColor:UIColor {
        switch type {
        case .error:
            return .errorBgColor
        case .warning:
            return .warningBgColor
        }
    }
    
    public var image:UIImage {
        return "warning".image()!
    }
    
    public var title:String {
        switch type {
        case .error:
            return "error".localized()
        case .warning:
            return "warning".localized()
        }
    }
}
