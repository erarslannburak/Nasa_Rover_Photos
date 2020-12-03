//
//  SplashController.swift
//  Nasa_Rover_Photos
//
//  Created by Burak Erarslan on 2.12.2020.
//

import UIKit
import RxSwift
import RxCocoa
import BaseModule
import NVActivityIndicatorView


class SplashController: UIViewController {

    @IBOutlet weak var indicatorContainer:UIView!
    
    let networkManager = NetworkManager()
    private let disposeBag = DisposeBag()
    
    
    lazy var activityIndicator:NVActivityIndicatorView! = {
        let view = NVActivityIndicatorView(frame: indicatorContainer.bounds, type: .ballSpinFadeLoader, color: .white, padding: 8)
        view.startAnimating()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkManager.isConnection.subscribe(onNext: {[weak self] (isConnection) in
            guard let self = self, isConnection != nil else {return}
            if isConnection! {
                self.view.removeAlert()
                self.networkManager.stopListener()
                self.indicatorContainer.addSubview(self.activityIndicator)
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    self.activityIndicator.stopAnimating()
                    self.window?.rootViewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateInitialViewController()
                }
            }else{
                self.view.addAlert(alertVM: AlertViewModel(.warning, message: "network-error-message".localized()))
            }
        }).disposed(by: disposeBag)
    }
}
