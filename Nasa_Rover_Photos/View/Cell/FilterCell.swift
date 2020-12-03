//
//  FilterCell.swift
//  Nasa_Rover_Photos
//
//  Created by Burak Erarslan on 28.11.2020.
//

import UIKit
import BaseModule
import RxSwift
import RxCocoa

class FilterCell: UITableViewCell {

    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var markBorderView:UIView!
    @IBOutlet weak var markSelectView:UIView!
    @IBOutlet weak var titleLabel:UILabel!
    
    weak var filterVM:FilterViewModel!
    
    func configure(to filterVM:FilterViewModel) {
        
        self.filterVM = filterVM
        
        titleLabel.text = filterVM.filterKey!.uppercased()
        titleLabel.attributedText = filterVM.filterKey!.uppercased().attributed(font: .filterTitleFont,color:UIColor(light: .black, dark: .white))
        
        self.filterVM.isSelect.subscribe(onNext:{[weak self] (_) in
            guard let self = self else {return}
            self.pressCell()
        }).disposed(by: disposeBag)
    
        setupUI()
    }
    
    func setupUI() {
        markBorderView.backgroundColor = .filterPopupColor
        self.markBorderView.border(color: .lightGray, width: 2.0)

        self.markBorderView.circle()
        self.markSelectView.circle()
        
        pressCell()
    }
    
    func pressCell() {
        if filterVM.isSelect.value {
            self.markSelectView.backgroundColor = .lightGray
        }else{
            self.markSelectView.backgroundColor = .clear
        }
    }
}
