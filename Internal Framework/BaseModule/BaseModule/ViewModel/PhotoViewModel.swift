//
//  PhotoViewModel.swift
//  NetworkModule
//
//  Created by Burak Erarslan on 1.12.2020.
//

import Foundation

public struct PhotoViewModel {
    let photo:Photo!
}

extension PhotoViewModel {
    public var id: Int {
        return photo.id
    }
    
    public var sol: Int {
        return photo.sol
    }
    
    public var camera: CameraViewModel {
        return CameraViewModel(camera: photo.camera)
    }
    
    public var image: String {
        return photo.image
    }
    
    public var date: String {
        return photo.date
    }
    
    public var rover: RoverViewModel {
        return RoverViewModel(rover: photo.rover)
    }
}
