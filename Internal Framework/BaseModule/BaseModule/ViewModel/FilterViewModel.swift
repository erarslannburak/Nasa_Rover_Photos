//
//  FilterViewModel.swift
//  BaseModule
//
//  Created by Burak Erarslan on 1.12.2020.
//

import Foundation
import RxSwift
import RxCocoa

public struct FilterListViewModel {

    public var filterVMList: [FilterViewModel]
    public let activeFilter = BehaviorRelay<FilterViewModel?>(value:nil)
    
    public init(filterVMList: [FilterViewModel]) {
        self.filterVMList = filterVMList
    }
}

extension FilterListViewModel {
    public func numberOfRowsInSection() -> Int {
        return filterVMList.count
    }
    
    public func cellForRowAt(at indexPath: IndexPath) -> FilterViewModel {
        return filterVMList[indexPath.row]
    }
}


extension FilterListViewModel {
    public func select(at indexPath:IndexPath) {
        for index in 0..<filterVMList.count {
            if index == indexPath.row {
                filterVMList[index].isSelect.accept(!filterVMList[index].isSelect.value)
            }else{
                filterVMList[index].isSelect.accept(false)
            }
        }
    }
    
    public func cancel() {
        
        guard self.activeFilter.value != nil else {
            filterVMList.forEach({$0.isSelect.accept(false)})
            return
        }
        
        filterVMList.forEach({
            if $0 == self.activeFilter.value {
                $0.isSelect.accept(true)
            }else{
                $0.isSelect.accept(false)
            }
        })
    }
    
    public mutating func apply() {
        for filterVM in filterVMList {
            if filterVM.isSelect.value {
                self.activeFilter.accept(filterVM)
                return
            }
        }
        self.activeFilter.accept(nil)
    }
}

// MARK: - Filter ViewModel
public class FilterViewModel:Equatable {

    public var filter:Filter
    public var isSelect = BehaviorRelay<Bool>(value: false)
    
    public init(_ filter:Filter) {
        self.filter = filter
    }
}

extension FilterViewModel {
    public static func == (lhs: FilterViewModel, rhs: FilterViewModel) -> Bool {
        return lhs.filterKey == rhs.filterKey
    }
}

extension FilterViewModel {
    public var filterKey:String? {
        return filter.getParemeter()
    }
}


