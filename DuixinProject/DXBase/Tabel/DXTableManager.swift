//
//  DXTableManager.swift
//  DuixinProject
//  Created by Taurus on 2020/3/7.
//  Copyright © 2020 xlk. All rights reserved.
//

import UIKit

class DXTableManager: NSObject {
    weak var table: UITableView?
    var sections: [DXBaseSection] = []
    var adapterManager: DXTableAdapter!
    let queue = DispatchQueue.init(label: "com.lg.queue")
    
    func initWithSections(arr: [DXBaseSection], adapter:DXTableAdapter) -> DXTableManager{
        sections = arr.map({$0})
        adapterManager = adapter
        adapterManager.tableManager = self
        
        return self
    }
    
    func bindToTableView(tableView: UITableView){
        tableView.delegate = adapterManager
        tableView.dataSource = adapterManager
        self.table = tableView
        queue.async {
            for section in self.sections{
                Dprint(section)
            }
        }
    }
    
    func rowAtIndexPath(indexPath: IndexPath) -> DXBaseRow?{
        assert(indexPath.section < self.sections.count, "数组越界")
        if indexPath.section < self.sections.count {
            let section: DXBaseSection = self.sections[indexPath.section]
            if indexPath.row < section.rows.count{
                return section.rows[indexPath.row]
            }
            return nil
        }
        return nil
    }
    
    func reloadData(){
        assert(self.table != nil, "tableView is nil")
        if Thread.isMainThread{
            self.table?.reloadData()
        }
        else{
            DispatchQueue.main.async {
                self.table?.reloadData()
            }
        }
    }

}
