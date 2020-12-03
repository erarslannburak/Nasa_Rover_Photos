//
//  ResourceLoader.swift
//  BaseModule
//
//  Created by Burak Erarslan on 3.12.2020.
//

import Foundation

enum PhotoResource:String {
    case CuriositySol1000Page1
    case CuriositySol1000Page2
    case CuriositySol1001Page1
    case CuriositySol1001Page2
    case SpiritSol1000Page1
    case SpiritSol1001Page1
    case OpportunitySol1000Page1
    case OpportunitySol1001Page1
    case OpportunitySol1001Page2
    case Opportunity_PANCAM
    case Opportunity_NAVCAM
    case Spirit_MINITES
    case Spirit_PANCAM
    case Spirit_NAVCAM
    case Curiosity_FHAZ
    case Curiosity_RHAZ
    case Curiosity_MAST
    
}

class ResourcesLoader {
    
    static func loadPhotoList(resource: PhotoResource) throws -> PhotoList {
        let bundle = Bundle.test
        let url = try bundle.url(forResource: resource.rawValue, withExtension: "json").unwrap()
        let data = try Data(contentsOf: url)
        let photoList = try JSONDecoder().decode(PhotoList.self, from: data)
        return photoList
    }
}

private extension Bundle {
    class Dummy { }
    static let test = Bundle(for: Dummy.self)
}
