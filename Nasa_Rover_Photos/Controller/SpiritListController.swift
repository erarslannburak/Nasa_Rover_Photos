//
//  SpiritListController.swift
//  Nasa_Rover_Photos
//
//  Created by Burak Erarslan on 28.11.2020.
//

import UIKit
import BaseModule

class SpiritListController: BaseCollectionController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = Constants.SPIRIT
        self.viewModel = PhotoListViewModel(PhotosService(.spirit))
        self.filterListViewModel = FilterListViewModel(filterVMList: [Fhaz(),Rhaz(),Navcam(),Pancam(),Minites()].compactMap(FilterViewModel.init))
        listenerViewModel()
    }
}
