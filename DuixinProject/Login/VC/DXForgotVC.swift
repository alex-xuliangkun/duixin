//  DXForgotVC.swift
//  DuixinProject
//  Created by Taurus on 2020/2/19.
//  Copyright © 2020 xlk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

class DXForgotVC: DXBaseVC {
    
    let dispose = DisposeBag()
    let type: Forgot_registerType = .forgot

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.backBtn.frame = CGRect.init(x: kScreenW - widthScale(value: 40), y: statusBarHeight, width: widthScale(value: 40), height: widthScale(value: 40))
        
        let name = (type == .forgot) ? "重置密码" : "注册账号"
        
        let navName = DXUIKitFactory.createLabel(text: name, font: ismediumFont(size: 20), textColor: .darkGray, alignment: .left, superView: self.view)
        navName.snp.makeConstraints { (make) in
            make.left.equalTo(widthScale(value: 30))
            make.top.equalTo(navigationHeight + widthScale(value: 10))
            make.height.equalTo(widthScale(value: 30))
            make.width.equalTo(widthScale(value: 100))
        }
        
        //手机号
        let x = widthScale(value: 30)
        let y = navigationHeight + widthScale(value: 120)
        let width = kScreenW - widthScale(value: 60)
        let height = widthScale(value: 30)
        var frame = CGRect.init(x: x, y: y, width: width, height: height)
        self.phoneT.frame = frame
        
        frame.origin.y += widthScale(value: 40)
        frame.size.height = widthScale(value: 0.5)
        DXUIKitFactory.createLine(frame: frame, superView: self.view)
        
        //验证码
        frame.origin.y += widthScale(value: 10)
        frame.size.width = kScreenW - widthScale(value: 160)
        frame.size.height = widthScale(value: 30)
        self.smsT.frame = frame
        
        self.sendSmsBtn.snp.makeConstraints { (make) in
            make.right.equalTo(widthScale(value: -30))
            make.left.equalTo(kScreenW - widthScale(value: 130))
            make.top.equalTo(navigationHeight + widthScale(value: 170))
            make.height.equalTo(widthScale(value: 30))
        }
        
        frame.origin.y += widthScale(value: 40)
        frame.size.height = widthScale(value: 0.5)
        DXUIKitFactory.createLine(frame: frame, superView: self.view)
        
        //新密码
        frame.origin.y += widthScale(value: 10)
        frame.size.width = kScreenW - widthScale(value: 60)
        frame.size.height = widthScale(value: 30)
        self.pwdT.frame = frame
        
        frame.origin.y += widthScale(value: 40)
        frame.size.height = widthScale(value: 0.5)
        DXUIKitFactory.createLine(frame: frame, superView: self.view)
        
        //再次输入新密码
        frame.origin.y += widthScale(value: 10)
        frame.size.height = widthScale(value: 30)
        self.pwdtwoT.frame = frame
        
        frame.origin.y += widthScale(value: 40)
        frame.size.height = widthScale(value: 0.5)
        DXUIKitFactory.createLine(frame: frame, superView: self.view)
        
        if type == .register{
            frame.origin.y += widthScale(value: 10)
            frame.size.height = widthScale(value: 30)
            self.invitationT.frame = frame
            
            frame.origin.y += widthScale(value: 40)
            frame.size.height = widthScale(value: 0.5)
            DXUIKitFactory.createLine(frame: frame, superView: self.view)
        }
        
        self.submitBtn.snp.makeConstraints { (make) in
            make.left.equalTo(widthScale(value: 30))
            make.right.equalTo(widthScale(value: -30))
            make.height.equalTo(widthScale(value: 40))
            make.top.equalTo(navigationHeight + widthScale(value: ((type == .forgot) ? 370 : 420)))
        }
        self.submitBtn.layer.cornerRadius = widthScale(value: 20)
        self.submitBtn.layer.masksToBounds = true
        
        self.setTextField()
    }
    
    //MARK: - rx绑定关系
    func setTextField(){
        self.phoneT.rx.text.orEmpty
            .subscribe(onNext: {[unowned self] (text) in
                if text.count >= 11{
                    self.phoneT.text = text.substring(startIndex: 0, endIndex: 11)
                }
            })
            .disposed(by: dispose)
        
        self.smsT.rx.text.orEmpty
            .subscribe(onNext: {[unowned self] (text) in
                if text.count == 6{
                    self.smsT.text = text.substring(startIndex: 0, endIndex: 6)
                }
            })
            .disposed(by: dispose)
        
        self.pwdT.rx.text.orEmpty
            .subscribe(onNext: { (text) in
                
            })
            .disposed(by: dispose)
        
        self.pwdtwoT.rx.text.orEmpty
            .subscribe(onNext: { (text) in
                
            })
            .disposed(by: dispose)
        
        let phoneVaild = self.phoneT.rx.text.orEmpty.map({[unowned self] (text) -> Bool in
            if text.count == 11{
                self.sendSmsBtn.isEnabled = true
            }
            else{
                self.sendSmsBtn.isEnabled = false
            }
            return text.count == 11
        })
        
        let smsVaild = self.smsT.rx.text.orEmpty.map({ (text) -> Bool in
            return text.count == 6
        })
        
        let pwdVaild = self.smsT.rx.text.orEmpty.map({ (text) -> Bool in
            return text.count == 6
        })
        
        let pwdtwoVaild = self.smsT.rx.text.orEmpty.map({(text) -> Bool in
            return text.count == 6
        })
                
        Observable.combineLatest(phoneVaild, smsVaild, pwdVaild, pwdtwoVaild) { $0 && $1 && $2 && $3}
            .bind(to: self.submitBtn.rx.isEnabled)
            .disposed(by: dispose)
    }
    
    //MARK: - Button
    lazy var backBtn: UIButton = {
        let btn = DXUIKitFactory.createButton(title: "", imgName: nil, imgBgName: nil, font: isregularFont(size: 10), titleColor: .darkGray, bgColor: .clear, superView: self.view)
        let img = UIImage.iconWithInfo(iconText: "\u{e61f}", iconSize: 10, iconColor: .darkGray)
        btn.setImage(img, for: .normal)
        btn.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        return btn
    }()
    
    lazy var sendSmsBtn: UIButton = {
        let btn = DXUIKitFactory.createButton(title: "发送验证码", imgName: nil, imgBgName: nil, font: isregularFont(size: 10), titleColor: .darkGray, bgColor: .red, superView: self.view)
        btn.rx.tap.subscribe(onNext: { () in
            
        })
        .disposed(by: dispose)
        return btn
    }()
    
    lazy var submitBtn: UIButton = {
        let btn = DXUIKitFactory.createButton(title: "确认", imgName: nil, imgBgName: nil, font: isregularFont(size: 10), titleColor: .white, bgColor: .red, superView: self.view)
        btn.rx.tap.subscribe(onNext: { () in
            
        })
        .disposed(by: dispose)
        return btn
    }()
    
    //MARK: - TextField
    lazy var phoneT: UITextField = {
        let phone = DXUIKitFactory.createTextField(placeholder: "请输入手机号", textColor: placeholderColor, font: placeholderFont, borderStyle: .none, superView: self.view)
        return phone
    }()
    
    lazy var smsT: UITextField = {
        let sms = DXUIKitFactory.createTextField(placeholder: "请输入验证码", textColor: placeholderColor, font: placeholderFont, borderStyle: .none, superView: self.view)
        return sms
    }()
    
    lazy var pwdT: UITextField = {
        let pwd = DXUIKitFactory.createTextField(placeholder: "请设置新密码", textColor: placeholderColor, font: placeholderFont, borderStyle: .none, superView: self.view)
        return pwd
    }()
    
    lazy var pwdtwoT: UITextField = {
        let pwdtwo = DXUIKitFactory.createTextField(placeholder: "请再次输入新密码", textColor: placeholderColor, font: placeholderFont, borderStyle: .none, superView: self.view)
        return pwdtwo
    }()
    
    lazy var invitationT: UITextField = {
        let invitation = DXUIKitFactory.createTextField(placeholder: "邀请码(选填)", textColor: placeholderColor, font: placeholderFont, borderStyle: .none, superView: self.view)
        return invitation
    }()
}
