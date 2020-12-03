//
//  FilterView.swift
//  Nasa_Rover_Photos
//
//  Created by Burak Erarslan on 28.11.2020.
//

import UIKit
import BaseModule

class FilterView: UIView {

    @IBOutlet weak var applyButton:UIButton!
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var filterContainerView:UIView!
    
    @IBOutlet weak var tableViewHeightConst: NSLayoutConstraint!
        
    var viewModel:FilterListViewModel!
                
    func configure(to viewModel:FilterListViewModel) {
    
        self.viewModel = viewModel
        setupUI()
    }
    
    func setupUI() {
        
        self.show()
        tableView.contentInset = UIEdgeInsets(top: 32, left: 0, bottom: 0, right: 0)
        tableViewHeightConst.constant = CGFloat((viewModel.numberOfRowsInSection()) * 55) + tableView.contentInset.top
        tableView.tableFooterView = UIView()
        self.applyButton.setAttributedTitle("apply".localized().attributed(font: .filterTitleFont,color: .white), for: .normal)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerFilterCell()
        
        self.filterContainerView.cornerRadius(for: 8)
        
        filterContainerView.backgroundColor = .filterPopupColor
        tableView.separatorColor = .filterListSeparatorColor
        applyButton.backgroundColor = .filterApplyButtonColor
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self)
            
        if location.x <= filterContainerView.frame.minX || location.x >= filterContainerView.frame.maxX || location.y <= filterContainerView.frame.minY || location.y >= filterContainerView.frame.maxY
            {
            remove()
        }
    }
    
    func remove() {
        viewModel.cancel()
        removeView()
    }
    
    @IBAction func close(_ sender: Any) {
        remove()
    }
    @IBAction func apply(_ sender: Any) {
        viewModel.apply()
        removeView()
    }
}

extension FilterView:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "filterCell", for: indexPath) as? FilterCell else {return UITableViewCell()}
                
        cell.configure(to: self.viewModel.cellForRowAt(at: indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.select(at: indexPath)
    }
}
