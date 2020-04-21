//
//  DXTableAdapter.swift
//  DuixinProject
//
//  Created by Taurus on 2020/3/8.
//  Copyright © 2020 xlk. All rights reserved.
//

import UIKit

class DXTableAdapter: DXBaseAdapter {
    weak var tableManager: DXTableManager!

}

extension DXTableAdapter:UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let manager = tableManager else {
            return 0
        }
        return manager.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Dprint("DXTableAdapter")
        return tableManager.sections[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row: DXBaseRow = tableManager.rowAtIndexPath(indexPath: indexPath)!
        let cell: UITableViewCell = row.cellForRowBlock(table: tableView, indexPath: indexPath)!
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let height = tableManager.rowAtIndexPath(indexPath: indexPath)?.rowHeight else {
            return 0
        }
        return height
    }
    
    
}
