//
//  PhotoList.swift
//  NetworkModule
//
//  Created by Burak Erarslan on 1.12.2020.
//

import Foundation

protocol IDs {
    var id: Int! { get }
}

protocol Name {
    var name: String! { get }
}

public struct PhotoList:Codable {
    var photos: [Photo] = []
}
