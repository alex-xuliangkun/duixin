//
//  DXShopSection.swift
//  DuixinProject
//
//  Created by Taurus on 2020/3/8.
//  Copyright © 2020 xlk. All rights reserved.
//

import UIKit

class DXShopSection: DXBaseSection {

    func shareWithRow(arr: [DXBaseRow]) ->DXShopSection{
        self.rows = arr.map({$0})
        return self
    }
}
