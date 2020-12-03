//
//  PhotosService.swift
//  BaseModule
//
//  Created by Burak Erarslan on 3.12.2020.
//

public protocol PhotosServiceProtocol {
    func request(sol:Int, page:Int,filter:String?,completion: @escaping (Swift.Result<PhotoList, NetworkError>) -> Void)
}

public class PhotosService:PhotosServiceProtocol {
    
    let rover:ResourcePath!
    
    public var baseURL: String {
        return "https://api.nasa.gov/mars-photos/api/v1/rovers"
    }
    
    public init(_ rover: ResourcePath) {
        self.rover = rover
    }
    
    public func request(sol:Int, page:Int,filter:String? = nil, completion: @escaping (Result<PhotoList, NetworkError>) -> Void) {
        
        var params:[String:Any] = ["sol":sol,"api_key":Constants.API_KEY,"page":page]
       
        if filter != nil {
            params["camera"] = filter
        }
        
        WebService().request( baseURL + "/\(rover!.rawValue)/photos", method: .get, params: params, type: PhotoList.self) { [weak self] (result) in
            guard self != nil else{return}
            switch result {
            case .success(let photolist):
                completion(.success(photolist))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
