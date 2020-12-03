//
//  AnalyticsEventManager.swift
//  Nasa_Rover_Photos
//
//  Created by Burak Erarslan on 2.12.2020.
//

import Foundation
import FirebaseAnalytics
import RxSwift
import RxCocoa
import BaseModule


class AnalyticsEventManager:NSObject {
    
    private let disposeBag = DisposeBag()
    
    public let photoDetail = BehaviorRelay<PhotoViewModel?>(value: nil)
    public let activeFilter = BehaviorRelay<FilterViewModel?>(value: nil)
    
    static let sharedInstance = AnalyticsEventManager()

    
    override init() {
        super.init()
        
        photoDetail.subscribe(onNext: {[weak self] (photoVM) in
            guard let self = self, photoVM != nil else {return}
            self.logEvent(params: ["id":photoVM!.id,"sol":photoVM!.sol,"camera":photoVM!.camera.fullName,"image":photoVM!.image,"date":photoVM!.date, "rover":photoVM!.rover.name] )
        }).disposed(by: disposeBag)
        
        activeFilter.subscribe(onNext: {[weak self] (filterVM) in
            guard let self = self else {return}
            var params:[String:Any] = [:]
            if filterVM != nil {
                params["filter"] = "All"
            }else{
                params["filter"] = filterVM?.filterKey
            }
            self.logEvent(params: params)
        }).disposed(by: disposeBag)
    }
    
    
    func logEvent(params: [String:Any]) {
        Analytics.logEvent("screen_event", parameters: params)
    }
}
