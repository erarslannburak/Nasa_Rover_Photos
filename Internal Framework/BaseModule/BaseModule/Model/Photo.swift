//
//  Photo.swift
//  NetworkModule
//
//  Created by Burak Erarslan on 1.12.2020.
//

import Foundation

struct Photo:IDs,Codable {
    var id: Int!
    let sol: Int!
    let camera: Camera!
    let image: String!
    let date: String!
    let rover: Rover!
    
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        sol = try container.decodeIfPresent(Int.self, forKey: .sol)
        camera = try container.decodeIfPresent(Camera.self, forKey: .camera)
        image = try container.decodeIfPresent(String.self, forKey: .image)
        date = try container.decodeIfPresent(String.self, forKey: .date)
        rover = try container.decodeIfPresent(Rover.self, forKey: .rover)

    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case sol
        case camera
        case image = "img_src"
        case date = "earth_date"
        case rover
    }
}
