//
//  DXBaseRow.swift
//  MvpSwift
//
//  Created by Taurus on 2020/3/7.
//  Copyright © 2020 xlk. All rights reserved.
//

import UIKit

class DXBaseRow: NSObject {
    
    var reuseIdentifier:String!
    var rowHeight: CGFloat = 44.0
    var registerName:String!
    var initalType: RowProtocolInitalType = .LGCODE
    var a: cellBlock!
    
    override init() {
        super.init()
        self.reuseIdentifier = NSStringFromClass(self.classForCoder)
        self.registerName = NSStringFromClass(UITableViewCell.classForCoder())
    }
    
//    func cellForRowBlock() -> cellBlock{
//        return { [unowned self] (table: UITableView, index: IndexPath) -> UITableViewCell in
//            if let cell = table.dequeueReusableCell(withIdentifier: self.reuseIdentifier){
//                return cell
//            }
//            else{
//                var cell: UITableViewCell!
//                if let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String {
//                    switch self.initalType {
//                    case .LGXIB:
//                        if let cla = NSClassFromString(clsName + "." + self.registerName) as? UITableViewCell.Type{
//                            cell = cla.init(style: .default, reuseIdentifier: self.reuseIdentifier)
//                        }
//                    default:
//                        break
//                    }
//                }
//                return cell
//            }
//        }
//    }
    
    
    func cellForRowBlock(table: UITableView, indexPath: IndexPath) -> UITableViewCell?{
            if let cell = table.dequeueReusableCell(withIdentifier: self.reuseIdentifier){
                return cell
            }
            else{
                var cell: UITableViewCell!
                if let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String {
                    if let cla = NSClassFromString(clsName + "." + self.registerName) as? UITableViewCell.Type{
                        switch self.initalType {
                        case .LGCODE:
                            cell = cla.init(style: .default, reuseIdentifier: self.reuseIdentifier)
                        default:
                            break
                        }
                        
                    }
                }
                return cell
            }
    }
}

//extension DXBaseRow: DXRowProtocol{
//    var reuseIdentifier: String {
//        reuseIdentifier
//    }
//
//
//}
