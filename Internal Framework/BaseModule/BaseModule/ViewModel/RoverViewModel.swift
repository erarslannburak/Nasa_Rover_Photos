//
//  RoverViewModel.swift
//  NetworkModule
//
//  Created by Burak Erarslan on 1.12.2020.
//

import Foundation

public struct RoverViewModel {
    let rover:Rover!
}

extension RoverViewModel {
 
    public var id: Int {
        return rover.id
    }
    
    public var name: String {
        return rover.name
    }
    
    public var landingDate: String {
        return rover.landingDate
    }
    
    public var launchDate: String {
        return rover.launchDate
    }
    
    public var status: String {
        return rover.status
    }
}
