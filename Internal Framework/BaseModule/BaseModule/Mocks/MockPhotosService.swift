//
//  MockPhotosService.swift
//  BaseModule
//
//  Created by Burak Erarslan on 3.12.2020.
//

import Foundation

class MockPhotosService:PhotosServiceProtocol {
    
    var resource:PhotoResource!
    
    init(_ resource:PhotoResource) {
        self.resource = resource
    }
        
    func request(sol: Int, page: Int, filter: String?, completion: @escaping (Result<PhotoList, NetworkError>) -> Void) {
        completion(.success(try! ResourcesLoader.loadPhotoList(resource: resource)))
    }
}
