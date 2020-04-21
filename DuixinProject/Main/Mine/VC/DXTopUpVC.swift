//
//  DXTopUpVC.swift
//  DuixinProject
//  Created by Taurus on 2020/3/12.
//  Copyright © 2020 xlk. All rights reserved.
//  充值界面

import UIKit

class DXTopUpVC: DXBaseVC {
    var valueL: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNavTitle(title: "充值", titleColor: .darkGray)
        self.baseRightBtn.isHidden = false
        self.baseRightBtn.setTitle("明细", for: .normal)
        
        let titleL = DXUIKitFactory.createLabel(text: "剩余福利", font: isregularFont(size: 14), textColor: .darkGray, alignment: .center, superView: self.view)
        titleL.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalTo(widthScale(value: 20))
            make.top.equalTo(navigationHeight + widthScale(value: 30))
        }
        
        valueL = DXUIKitFactory.createLabel(text: "", font: isregularFont(size: 24), textColor: .red, alignment: .center, superView: self.view)
        valueL.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalTo(widthScale(value: 20))
            make.top.equalTo(titleL.snp.bottom).offset(widthScale(value: 15))
        }
        
        let icon = DXUIKitFactory.createLabel(text: "￥", font: isregularFont(size: 14), textColor: .darkGray, alignment: .center, superView: self.view)
        icon.snp.makeConstraints { (make) in
            make.left.equalTo(widthScale(value: 10))
            make.height.width.equalTo(widthScale(value: 15))
            make.top.equalTo(valueL.snp.bottom).offset(widthScale(value: 150))
        }
        
    }
}
