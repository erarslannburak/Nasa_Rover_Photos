//
//  UITableView+Extension.swift
//  Nasa_Rover_Photos
//
//  Created by Burak Erarslan on 28.11.2020.
//

import Foundation
import UIKit

extension UITableView {
    func registerFilterCell() {
        register(UINib(nibName: "FilterCell", bundle: nil), forCellReuseIdentifier: "filterCell")
    }
}
