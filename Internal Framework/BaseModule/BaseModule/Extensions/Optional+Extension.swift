//
//  Optional+Extension.swift
//  BaseModule
//
//  Created by Burak Erarslan on 3.12.2020.
//

import Foundation

public extension Optional {
    
    struct FoundNilWhileUnwrappingError: Error { }
    
    func unwrap() throws -> Wrapped {
        switch self {
        case .some(let wrapped):
            return wrapped
        case .none:
            throw FoundNilWhileUnwrappingError()
        }
    }
}
