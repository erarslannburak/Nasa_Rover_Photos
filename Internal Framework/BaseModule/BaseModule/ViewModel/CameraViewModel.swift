//
//  CameraViewModel.swift
//  NetworkModule
//
//  Created by Burak Erarslan on 1.12.2020.
//

import Foundation

public struct CameraViewModel {
    let camera:Camera!
}

extension CameraViewModel {
    public var id: Int {
        return camera.id
    }
    
    public var name: String {
        return camera.name
    }
    
    public var roverID: Int {
        return camera.roverID
    }
    
    public var fullName: String {
        return camera.fullName
    }
}
