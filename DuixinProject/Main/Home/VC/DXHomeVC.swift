//
//  DXHomeVC.swift
//  DuixinProject
//
//  Created by Taurus on 2020/3/5.
//  Copyright © 2020 xlk. All rights reserved.
//

import UIKit

class DXHomeVC: DXBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .orange
        
        let a = Localized(key: "IM_ChatList_Title")
        
        Dprint(a)
    }
}
