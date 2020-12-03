//
//  LanguageManager.swift
//  BaseModule
//
//  Created by Burak Erarslan on 3.12.2020.
//

import Foundation

public class LanguageManager {
    public class func localized(_ key: String, bundle: Bundle? = nil) -> String {
        guard let bundle = bundle else {
            return NSLocalizedString(key, comment: "")
        }
        return NSLocalizedString(key, tableName: nil, bundle: bundle, value: "", comment: "")
    }
}
