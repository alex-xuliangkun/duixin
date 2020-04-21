//
//  DXBaseSection.swift
//  DuixinProject
//
//  Created by Taurus on 2020/3/7.
//  Copyright © 2020 xlk. All rights reserved.
//

import UIKit

typealias sectionblock = (_ tableView: UITableView, _ section: NSInteger) -> UIView

class DXBaseSection: NSObject {
    var viewForHeader: sectionblock!
    var viewForFooter: sectionblock!
    var heightHeader: CGFloat?
    var rows: [DXBaseRow] = []
    
    func createHeaderView(viewBlock: @escaping (_ tableView: UITableView, _ section: NSInteger) -> UIView ){
        viewForHeader = viewBlock
    }
    
    func creatFooterView(viewBlock: @escaping (_ tableView: UITableView, _ section: NSInteger) -> UIView ){
        viewForFooter = viewBlock
    }
    
    func sectionIndexTitle() -> String{
        return ""
    }
        
    func heightForHeader() -> CGFloat{
        guard let height = heightHeader else {
            return 0
        }
        return height
    }

}
