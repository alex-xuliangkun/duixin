//
//  DXBasePresenter.swift
//  DuixinProject
//
//  Created by Taurus on 2020/2/19.
//  Copyright © 2020 xlk. All rights reserved.
//

import UIKit

class DXBasePresenter: NSObject {  //数据处理
    weak var baseController: UIViewController?
    weak var baseView: DXBaseView?
    weak var adapter: DXBaseAdapter?
       
   required override init() {
       super.init()
   }
}

class DXBaseInteractor: NSObject{ // 逻辑跳转处理
    weak var baseController: UIViewController?
    
    required override init() {
        super.init()
    }
}

class DXBaseView: UIView{
    weak var basePresent: DXBasePresenter?
    weak var baseInteractor: DXBaseInteractor?
    
    deinit {
        self.context = nil
    }
}

class DXBaseContext: NSObject {
    var present: DXBasePresenter?
    var interactor: DXBaseInteractor?
    var view: DXBaseView?
    
    required override init() {
        super.init()
    }
    
    deinit {
        
    }
    

}
