//
//  PhotoListViewModel.swift
//  NetworkModule
//
//  Created by Burak Erarslan on 1.12.2020.
//

import Foundation
import RxSwift
import RxCocoa

public class PhotoListViewModel {
        
    private let disposeBag = DisposeBag()

    public let photosVM = BehaviorRelay<[PhotoViewModel]>(value: [])
    public var activeFilter = BehaviorRelay<FilterViewModel?>(value: nil)
    public let alertVM = BehaviorRelay<AlertViewModel?>(value:nil)
    public let sol = BehaviorRelay<Int?>(value: nil)
    public let page = BehaviorRelay<Int?>(value: nil)
    public let isLoading = BehaviorRelay<Bool>(value: false)

    
    var service:PhotosServiceProtocol!

    public init(_ service: PhotosServiceProtocol) {
    
        self.service = service
        
        //next sol
        sol.subscribe(onNext: {[weak self] (sol) in
            guard let self = self, sol != nil else{return}
            self.page.accept(1)
        }).disposed(by: disposeBag)
        
        //next page
        page.subscribe(onNext: {[weak self] (page) in
            guard let self = self, page != nil else{return}
            self.getPhotos()
        }).disposed(by: disposeBag)
        
        //apply Filter
        activeFilter.subscribe(onNext: { [weak self] (selectFilter) in
            guard let self = self else {return}
            self.photosVM.accept([])
            self.sol.accept(1000)
        }).disposed(by: disposeBag)
    }
    
    public func updateActiveFilter(filterVM: FilterViewModel?) {
        //yeni seçilen filtre ile mevcut filtre aynımı diye kontrol ediyorum. Eğer aynı ise tekrardan request atmama gerek yok.
        if self.activeFilter.value != filterVM {
            self.activeFilter.accept(filterVM)
        }
    }
    
    public func nextPage() {
        self.page.accept((self.page.value ?? 1) + 1)
    }
    
    public func nextSol() {
        self.sol.accept((self.sol.value ?? 1000) + 1)
    }
}

// MARK: - PhotoListProtocol CollectionViews Func
extension PhotoListViewModel {
    public func numberOfSections() -> Int {
        return 1
    }
    public func numberOfRowsInSection() -> Int {
        return photosVM.value.count
    }
    public func cellForRowAt(at indexPath: IndexPath) -> PhotoViewModel {
        return photosVM.value[indexPath.row]
    }
}

// MARK: - Webservice Func
extension PhotoListViewModel {
    public func getPhotos() {
        self.isLoading.accept(true)
        service.request(sol:self.sol.value ?? 1000,page:self.page.value ?? 1,filter: activeFilter.value?.filterKey ?? nil) { [weak self](result) in
            guard let self = self else {return}
            switch result {
            case .success(let photoList):
                if photoList.photos.isEmpty {
                    self.sol.accept((self.sol.value ?? 1000) + 1) // Eğer servisten veri boş gelişrse sol değerini 1 arttırarak bir sonraki günün verilerini çekiyorum
                    return
                }else{
                    self.photosVM.accept(self.photosVM.value + (photoList.photos.compactMap(PhotoViewModel.init)))
                    self.isLoading.accept(false)
                    return
                }
            case .failure(let error):
                self.isLoading.accept(false)
                self.alertVM.accept(AlertViewModel(.error, message: error.rawValue))
            }
        }
    }
}
