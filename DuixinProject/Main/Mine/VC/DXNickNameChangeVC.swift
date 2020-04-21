//
//  DXNickNameChangeVC.swift
//  DuixinProject
//
//  Created by Taurus on 2020/3/11.
//  Copyright © 2020 xlk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class DXNickNameChangeVC: DXBaseVC {
    var nickNameTF: UITextField!
    let dispose = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNavTitle(title: "修改昵称", titleColor: .darkGray)
        self.baseRightBtn.setTitle("完成", for: .normal)
        self.baseRightBtn.isHidden = false
        
        nickNameTF = DXUIKitFactory.createTextField(placeholder: "请输入新昵称", textColor: .darkGray, font: isregularFont(size: 15), borderStyle: .none, superView: self.view)
        nickNameTF.snp.makeConstraints { (make) in
            make.left.equalTo(widthScale(value: 10))
            make.right.equalTo(widthScale(value: -10))
            make.top.equalTo(navigationHeight + widthScale(value: 10))
            make.height.equalTo(widthScale(value: 40))
        }
        nickNameTF.rx.text.orEmpty
            .subscribe(onNext: { (text) in
                
            })
        .disposed(by: dispose)
        
    }
    
    override func rightAction() {
        
    }
}
