//
//  DXShopVC.swift
//  DuixinProject
//
//  Created by Taurus on 2020/3/5.
//  Copyright © 2020 xlk. All rights reserved.
//

import UIKit

class DXShopVC: DXBaseVC {
    let adapter = DXShopAdapter.init()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.view .addSubview(self.table)
        
        let model = DXShopModel.init()
        let model1 = DXShopModel.init()
        let model2 = DXShopModel.init()
        
       let shoprow = DXShopRow.init()
        let shops = [model,model1,model2]
        let row: DXBaseRow = shoprow.initWithRecommends(shops: shops) as DXBaseRow
        let sec = DXShopSection.init()
        let section: DXBaseSection = sec.shareWithRow(arr: [row,row]) as DXBaseSection
        
        let manager = DXTableManager.init()
        self.table.tableManager = manager.initWithSections(arr: [section], adapter: adapter)
        
    }
    
    lazy var table: UITableView = {
        let tableview = UITableView.init(frame: CGRect.init(x: 0, y: widthScale(value: 200), width: kScreenW, height: kScreenH - widthScale(value: 400)), style: .plain)
        tableview.backgroundColor = .orange
        tableview.tableFooterView = UIView.init()
        return tableview
    }()
}
