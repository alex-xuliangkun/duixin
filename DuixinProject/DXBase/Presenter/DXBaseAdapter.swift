//  DXBaseAdapter.swift
//  DuixinProject
//  Created by Taurus on 2020/2/19.
//  Copyright © 2020 xlk. All rights reserved.
//  代理处理

import UIKit

protocol DXBaseAdapterProtocol {
    func didSelectCell(type: PopType,indexpath: IndexPath)
}

class DXBaseAdapter: NSObject {
    var arr: [Any] = []
    var delegate: DXBaseAdapterProtocol!
    
    
    
    func getAdapterArray() -> [Any]{
        return arr
    }
    
    func setAdapterArray(data:[Any]){
        arr.removeAll()
        arr = data.map{ $0 }
    }
}


