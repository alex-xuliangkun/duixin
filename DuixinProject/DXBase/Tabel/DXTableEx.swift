//
//  DXTableEx.swift
//  DuixinProject
//
//  Created by Taurus on 2020/3/7.
//  Copyright © 2020 xlk. All rights reserved.
//

import UIKit

extension UITableView{
    var tableManager: DXTableManager? {
        set(newValue) {
            objc_setAssociatedObject(self, &NSObjcCategoriesKeys.tableManager, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            tableManager?.bindToTableView(tableView: self)
        }
        get {
            let manager = objc_getAssociatedObject(self, &NSObjcCategoriesKeys.tableManager) as? DXTableManager
            return  manager
        }
    }
}
