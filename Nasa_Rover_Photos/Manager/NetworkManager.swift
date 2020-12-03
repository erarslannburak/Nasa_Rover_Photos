//
//  NetworkManager.swift
//  Nasa_Rover_Photos
//
//  Created by Burak Erarslan on 2.12.2020.
//

import Alamofire
import RxSwift
import RxCocoa

struct NetworkManager {

    let manager = Alamofire.NetworkReachabilityManager()
    let isConnection = BehaviorRelay<Bool?>(value: nil)

    init() {
        startListener()
    }
    
    func startListener() {
        manager?.startListening { status in
            switch status {
            case .notReachable,.unknown:
                isConnection.accept(false)
            case .reachable:
                isConnection.accept(true)
            }
        }
    }
    
    func stopListener() {
        manager?.stopListening()
    }
}

