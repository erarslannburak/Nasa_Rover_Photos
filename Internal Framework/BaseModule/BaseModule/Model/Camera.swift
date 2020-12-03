//
//  Camera.swift
//  NetworkModule
//
//  Created by Burak Erarslan on 1.12.2020.
//

import Foundation

struct Camera:IDs,Name,Codable {
    var id: Int!
    var name: String!
    let roverID: Int!
    let fullName: String!
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        roverID = try container.decodeIfPresent(Int.self, forKey: .roverID)
        fullName = try container.decodeIfPresent(String.self, forKey: .fullName)
    }
    
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case roverID = "rover_id"
        case fullName = "full_name"
    }
}
