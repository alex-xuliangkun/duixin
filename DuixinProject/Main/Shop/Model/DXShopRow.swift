//
//  DXShopRow.swift
//  DuixinProject
//
//  Created by Taurus on 2020/3/8.
//  Copyright © 2020 xlk. All rights reserved.
//

import UIKit

class DXShopRow: DXBaseRow {
    var shopArr: [DXShopModel] = []
    
    func initWithRecommends(shops: [DXShopModel]) -> DXShopRow{
        self.shopArr = shops.map({$0})
        
        self.rowHeight =  50
        self.reuseIdentifier = "DXShopTableViewCell"
        self.initalType = .LGCODE
        self.registerName = "DXShopTableViewCell"
        
        return self
    }
}
