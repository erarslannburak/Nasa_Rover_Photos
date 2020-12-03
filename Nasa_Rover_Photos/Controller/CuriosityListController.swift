//
//  CuriosityListController.swift
//  Nasa_Rover_Photos
//
//  Created by Burak Erarslan on 27.11.2020.
//

import UIKit
import BaseModule

class CuriosityListController: BaseCollectionController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.title = Constants.CURIOSITY
        self.viewModel = PhotoListViewModel(PhotosService(.curiosity))
        self.filterListViewModel =  FilterListViewModel(filterVMList: [Fhaz(),Rhaz(),Mast(),Chemcam(),Mahli(),Mardi(),Navcam()].compactMap(FilterViewModel.init))
        listenerViewModel()
    }
}
