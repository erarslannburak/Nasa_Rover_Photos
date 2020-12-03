//
//  Rover.swift
//  NetworkModule
//
//  Created by Burak Erarslan on 1.12.2020.
//

import Foundation

struct Rover:IDs,Name,Codable {
    var id: Int!
    var name: String!
    let landingDate: String!
    let launchDate: String!
    let status: String!
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        landingDate = try container.decodeIfPresent(String.self, forKey: .landingDate)
        launchDate = try container.decodeIfPresent(String.self, forKey: .launchDate)
        status = try container.decodeIfPresent(String.self, forKey: .status)

    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case landingDate = "landing_date"
        case launchDate = "launch_date"
        case status
    }
}
