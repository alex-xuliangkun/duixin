//  DXVideosVC.swift
//  DuixinProject
//  Created by Taurus on 2020/3/11.
//  Copyright © 2020 xlk. All rights reserved.
//  视频活动界面

import UIKit

class DXVideosVC: DXBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavTitle(title: "活动", titleColor: .darkGray)
        self.baseRightBtn.setTitle("删除", for: .normal)
        self.baseRightBtn.isHidden = false
        
    }
}
