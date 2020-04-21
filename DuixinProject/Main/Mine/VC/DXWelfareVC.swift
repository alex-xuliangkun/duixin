//  DXWelfareVC.swift
//  DuixinProject
//  Created by Taurus on 2020/3/11.
//  Copyright © 2020 xlk. All rights reserved.
//  福利界面

import UIKit
import RxCocoa
import RxSwift

class DXWelfareVC: DXBaseVC {
    var valueL: UILabel!
    let dispose = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavTitle(title: "", titleColor: .darkGray)
        self.baseRightBtn.isHidden = false
        self.baseRightBtn.setTitle("福利明细", for: .normal)
        
        let iconImg: UIImage = UIImage.iconWithInfo(iconText: "\u{e702}", iconSize: 40, iconColor: .red)
        let icon = UIImageView.init(image: iconImg)
        self.view.addSubview(icon)
        icon.snp.makeConstraints { (make) in
            make.width.height.equalTo(widthScale(value: 60))
            make.centerX.equalToSuperview()
            make.top.equalTo(navigationHeight + widthScale(value: 30))
        }
        
        let nameL = DXUIKitFactory.createLabel(text: "我的福利", font: isregularFont(size: 16), textColor: .darkGray, alignment: .center, superView: self.view)
        nameL.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalTo(widthScale(value: 20))
            make.top.equalTo(icon.snp.bottom).offset(widthScale(value: 40))
        }
        
        valueL = DXUIKitFactory.createLabel(text: "", font: isregularFont(size: 20), textColor: .darkGray, alignment: .center, superView: self.view)
        valueL.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalTo(widthScale(value: 20))
            make.top.equalTo(nameL.snp.bottom).offset(widthScale(value: 30))
        }
        
        let rulesBtn = DXUIKitFactory.createButton(title: "福利规则 >", imgName: nil, imgBgName: nil, font: isregularFont(size: 16), titleColor: .red, bgColor: .clear, superView: self.view)
        rulesBtn.snp.makeConstraints { (make) in
            make.width.equalTo(widthScale(value: 100))
            make.height.equalTo(widthScale(value: 40))
            make.centerX.equalToSuperview()
            make.top.equalTo(valueL.snp.bottom).offset(widthScale(value: 100))
        }
        rulesBtn.rx.tap
            .subscribe(onNext: { () in
                
            })
        .disposed(by: dispose)
        
        let topUpBtn = DXUIKitFactory.createButton(title: "充值", imgName: nil, imgBgName: nil, font: isregularFont(size: 16), titleColor: .white, bgColor: .red, superView: self.view)
        topUpBtn.snp.makeConstraints { (make) in
            make.width.equalTo(widthScale(value: 200))
            make.height.equalTo(widthScale(value: 40))
            make.centerX.equalToSuperview()
            make.top.equalTo(rulesBtn.snp.bottom).offset(widthScale(value: 100))
        }
        topUpBtn.layer.cornerRadius = widthScale(value: 20)
        topUpBtn.layer.masksToBounds = true
        topUpBtn.rx.tap
            .subscribe(onNext: {[weak self] () in
                guard let strongself = self else{return}
                let vc = DXTopUpVC()
                strongself.navigationController?.pushViewController(vc, animated: true)
            })
        .disposed(by: dispose)
        
        let withdrawalBtn = DXUIKitFactory.createButton(title: "提现", imgName: nil, imgBgName: nil, font: isregularFont(size: 16), titleColor: .red, bgColor: .white, superView: self.view)
        withdrawalBtn.snp.makeConstraints { (make) in
            make.width.equalTo(widthScale(value: 200))
            make.height.equalTo(widthScale(value: 40))
            make.centerX.equalToSuperview()
            make.top.equalTo(topUpBtn.snp.bottom).offset(widthScale(value: 15))
        }
        withdrawalBtn.layer.cornerRadius = widthScale(value: 20)
        withdrawalBtn.layer.masksToBounds = true
        withdrawalBtn.layer.borderColor = UIColor.red.cgColor
        withdrawalBtn.layer.borderWidth = 1
        withdrawalBtn.rx.tap
            .subscribe(onNext: { () in
                
            })
        .disposed(by: dispose)
    }    
    
    //MARK: - 事件响应
    override func rightAction() {
        let vc = DXWelfareDetailsVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
