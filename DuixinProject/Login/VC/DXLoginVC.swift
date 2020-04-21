//
//  DXLoginVC.swift
//  DuixinProject
//
//  Created by Taurus on 2020/2/19.
//  Copyright © 2020 xlk. All rights reserved.
//

import UIKit

class DXLoginVC: DXBaseVC {

    override func viewDidLoad() {
        self.configMVP(name: "Login")
        super.viewDidLoad()
        
//        Dprint(UIApplication.shared.windows.first?.safeAreaInsets.bottom)
        Dprint(UIApplication.shared.statusBarFrame.height)
        
        let adapter = DXLoginAdapter.init()
        
        let view: DXLoginView = self.context?.view as! DXLoginView
        view.buildHomeView(adapter: adapter)
    }
}
