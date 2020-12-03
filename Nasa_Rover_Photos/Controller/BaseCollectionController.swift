//
//  BaseCollectionController.swift
//  Nasa_Rover_Photos
//
//  Created by Burak Erarslan on 28.11.2020.
//

import UIKit
import BaseModule
import UIModule
import RxCocoa
import RxSwift
import NVActivityIndicatorView

class BaseCollectionController: UICollectionViewController {
        
    var viewModel:PhotoListViewModel!
    var filterListViewModel:FilterListViewModel!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        setupUI()
    }
    
    func setupUI() {
        self.collectionView.registerPhotoCell()
        self.collectionView.enableFullScreenPaging()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: "filter".image(), style: .plain, target: self, action: #selector(BaseCollectionController.showFilterView))
        self.navigationItem.rightBarButtonItem?.tintColor = .filterNavigationItemColor
    }
    
    func listenerViewModel() {
        
        //fetchrequest succes
        self.viewModel.photosVM.subscribe({
            [weak self] (_) in
            guard let self = self else {return}
            self.collectionView.reloadData()
        }).disposed(by: disposeBag)
        
        
        // isLoading Indicator
        self.viewModel.isLoading.subscribe(onNext: { [weak self] (value) in
            guard let self = self else {return}
            if value {
                self.view.showLoading()
            }else{
                self.view.hideLoading()
            }
        }).disposed(by: disposeBag)
        
        
        //applyFilter
        filterListViewModel.activeFilter.subscribe(onNext: {[weak self] (filterVM) in
            guard let self = self else {return}
            AnalyticsEventManager.sharedInstance.activeFilter.accept(filterVM)
            self.viewModel.updateActiveFilter(filterVM:filterVM)
        }).disposed(by: disposeBag)
        
        
        //AlertMessage
        self.viewModel.alertVM.subscribe(onNext: {[weak self] (alertVM) in
            guard let self = self,alertVM != nil else {return}
            self.tabBarController?.view.addAlert(alertVM: alertVM!)
        }).disposed(by: disposeBag)
        
    }
    
    @objc func showFilterView() {
        guard let filterView = Util.getViewFromNib(nibName: "FilterView") as? FilterView else {return}
        filterView.frame = (self.tabBarController?.view.bounds)!
        filterView.configure(to: filterListViewModel)
        self.tabBarController?.view.addSubview(filterView)
    }
}


//MARK: - CollectionView
extension BaseCollectionController {
   
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.viewModel?.numberOfSections() ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel?.numberOfRowsInSection() ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as? PhotoCollectionCell else {return UICollectionViewCell()}
        cell.configure((self.viewModel?.cellForRowAt(at: indexPath))!)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.collectionView.isUserInteractionEnabled = false
        guard let detailView = Util.getViewFromNib(nibName: "PhotoDetailView") as? PhotoDetailView else {return}
        detailView.frame = (self.tabBarController?.view.bounds)!
        detailView.configure(to: self.viewModel.cellForRowAt(at: indexPath))
        detailView.removeViewClosure = { () in
            detailView.removeView()
            self.collectionView.isUserInteractionEnabled = true
        }
        self.tabBarController?.view.addSubview(detailView)
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if collectionView.isLastRow(indexPath: indexPath,dataCount: viewModel.numberOfRowsInSection()) {
            viewModel.page.accept((viewModel.page.value ?? 1) + 1) // Bir sonraki page geç
        }
    }
}
