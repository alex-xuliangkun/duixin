//
//  DXRowProtocol.swift
//  MvpSwift
//
//  Created by Taurus on 2020/3/7.
//  Copyright © 2020 xlk. All rights reserved.
//

import UIKit

typealias cellBlock = (_ tableView: UITableView, _ section: IndexPath) -> UITableViewCell

enum RowProtocolInitalType: Int {
    case LGXIB
    case LGCODE
}


protocol DXRowProtocol {
    var reuseIdentifier: String { get }
}
