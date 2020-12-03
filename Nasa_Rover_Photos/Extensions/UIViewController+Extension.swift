//
//  UIViewController+Extension.swift
//  Nasa_Rover_Photos
//
//  Created by Burak Erarslan on 2.12.2020.
//

import Foundation
import UIKit

extension UIViewController {
    var window: UIWindow? {
        if #available(iOS 13, *) {
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                let delegate = windowScene.delegate as? SceneDelegate, let window = delegate.window else { return nil }
                   return window
        }
        return (UIApplication.shared.delegate as! AppDelegate).window
    }
}
