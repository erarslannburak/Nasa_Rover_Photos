//
//  WebService.swift
//  BaseModule
//
//  Created by Burak Erarslan on 1.12.2020.
//

import Alamofire

public enum NetworkError:String,Error {
    case decodingError = "DECODEING ERROR"
    case domainError = "DOMAIN ERROR"
    case urlError = "URL ERROR"
}

public class WebService {
    
    public func request<T>(_ url: String, method: HTTPMethod = .get,params: Parameters = [:],type: T.Type = T.self, completion: @escaping (Swift.Result<T, NetworkError>) -> Void) where T:Codable{

        
        AF.request(url, method: method, parameters: params).validate().responseJSON { response in
            switch response.result {
            case .success:
                guard let data = response.data else {
                    completion(.failure(.domainError))
                    return
                }
                print(data)

                guard let result = try? JSONDecoder().decode(type, from: data) else {
                    completion(.failure(.decodingError))
                    return
                }
                DispatchQueue.main.async {
                    print(result)
                    completion(.success(result))
                }
            case .failure:
                completion(.failure(.domainError))
            }
        }
    }
}
