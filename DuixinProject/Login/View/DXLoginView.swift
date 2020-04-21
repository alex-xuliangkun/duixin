//
//  DXLoginView.swift
//  DuixinProject
//
//  Created by Taurus on 2020/2/19.
//  Copyright © 2020 xlk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

fileprivate let minUsernameLength = 11
fileprivate let minPasswordLength = 6

class DXLoginView: DXBaseView {
    var phoneT: UITextField!
    var pwdT: UITextField!
    var phoneNumL: UILabel!
    var pwdNumL: UILabel!
    let dispose = DisposeBag()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .orange
    }
       
    func buildHomeView(adapter: DXLoginAdapter){
        self.backgroundColor = .white
        
        let headerIcon = UIImageView.init()
        self.addSubview(headerIcon)
        
        let icon = UIImageView.init()
        self.addSubview(icon)
        
        let name = DXUIKitFactory.createLabel(text: "Hi欢迎使用兑幸", font: isregularFont(size: 10), textColor: RGB(h: 0x787878, alpha: 1), alignment: .center, superView: self)
        name.frame = CGRect.init(x: 0, y: widthScale(value: 200), width: kScreenW, height: widthScale(value: 20))
        
        var x = widthScale(value: 30)
        var y = widthScale(value: 250)
        var width = kScreenW - widthScale(value: 60)
        phoneT = DXUIKitFactory.createTextField(placeholder: "请输入手机号", textColor: RGB(h: 0x787878, alpha: 1), font: isregularFont(size: 15), borderStyle: .none, superView: self)
        phoneT?.frame = CGRect.init(x: x, y: y, width: width, height: 30)
        
        y = widthScale(value: 280)
        DXUIKitFactory.createLine(frame: CGRect.init(x: x, y: y, width: width, height: widthScale(value: 0.5)), superView: self)
        
        x = kScreenW - widthScale(value: 80)
        width = widthScale(value: 50)
        y = widthScale(value: 285)
        phoneNumL = DXUIKitFactory.createLabel(text: "0/11", font: isregularFont(size: 10), textColor: .darkGray, alignment: .right, superView: self)
        phoneNumL?.frame = CGRect.init(x: x, y: y, width: width, height: widthScale(value: 15))
        
        x = widthScale(value: 30)
        y = widthScale(value: 300)
        width = kScreenW - widthScale(value: 60)
        pwdT = DXUIKitFactory.createTextField(placeholder: "请输入验证码", textColor: RGB(h: 0x787878, alpha: 1), font: isregularFont(size: 15), borderStyle: .none, superView: self)
        pwdT?.frame = CGRect.init(x: x, y: y, width: width, height: 30)
               
        y = widthScale(value: 330)
        DXUIKitFactory.createLine(frame: CGRect.init(x: x, y: y, width: width, height: widthScale(value: 0.5)), superView: self)
        
        x = kScreenW - widthScale(value: 80)
        width = widthScale(value: 50)
        y = widthScale(value: 335)
        pwdNumL = DXUIKitFactory.createLabel(text: "0/6", font: isregularFont(size: 10), textColor: .darkGray, alignment: .right, superView: self)
        pwdNumL?.frame = CGRect.init(x: x, y: y, width: width, height: widthScale(value: 15))
        
        x = widthScale(value: 30)
        y = widthScale(value: 370)
        self.pwdsmsBtn.frame = CGRect.init(x: x, y: y, width: widthScale(value: 60), height: widthScale(value: 30))
        
        x = kScreenW - widthScale(value: 90)
        self.forgotPwdBtn.frame = CGRect.init(x: x, y: y, width: widthScale(value: 60), height: widthScale(value: 30))
        self.forgotPwdBtn.isHidden = true
        
        x = widthScale(value: 60)
        y = widthScale(value: 450)
        self.loginBtn.frame = CGRect.init(x: x, y: y, width: kScreenW - 2*x, height: widthScale(value: 40))
        self.loginBtn.layer.cornerRadius = widthScale(value: 20)
        
        y = widthScale(value: 500)
        self.createBtn.frame = CGRect.init(x: x, y: y, width: kScreenW - 2*x, height: widthScale(value: 40))
        
        self.setphoneSms()
    }
    
    //MARK: - rx绑定关系
    func setphoneSms(){
        phoneT.rx.text.orEmpty
            .subscribe(onNext: {[weak self] (text) in
                guard let strongself = self else{ return }
                if text.count >= 11{
                    strongself.phoneT.text = text.substring(startIndex: 0, endIndex: 11)
                }
                strongself.phoneNumL.text = String.init(format: "%d/11", text.count)
            })
            .disposed(by: dispose)
        
        pwdT.rx.text.orEmpty
            .subscribe(onNext: {[unowned self] (text) in
                self.pwdNumL.text = String.init(format: "%d/6", text.count)
            })
            .disposed(by: dispose)
        
        let phoneVaild = phoneT.rx.text.orEmpty.map({ (text) -> Bool in
            return text.count == minUsernameLength
        })
        
        let pwdVaild = pwdT.rx.text.orEmpty.map({ [unowned self] (text) -> Bool in
            if self.pwdsmsBtn.isSelected{
                return text.count == 6
            }
            else{
                return text.count == 6
            }
        })
        
//        Observable.combineLatest(phoneVaild, pwdVaild) { $0 && $1 }
//            .bind(to: self.loginBtn.rx.isEnabled)
//            .disposed(by: dispose)
        
    }
        
    //MARK: - btn
    lazy var pwdsmsBtn: UIButton = {
        let btn = DXUIKitFactory.createButton(title: "短信登录", imgName: nil, imgBgName: nil, font: isregularFont(size: 13), titleColor: .darkGray, bgColor: .clear, superView: self)
        btn.setTitle("密码登录", for: .selected)
        btn.isSelected = true
        btn.rx.tap
            .subscribe(onNext: {[unowned self] () in
                if btn.isSelected{
                    self.pwdsmsBtn.isSelected = false
                    self.forgotPwdBtn.isHidden = false
                    self.pwdT?.placeholder = "请输入密码"
                    self.smsBtn.isHidden = true
                }
                else{
                    self.pwdsmsBtn.isSelected = true
                    self.forgotPwdBtn.isHidden = true
                    self.pwdT?.placeholder = "请输入验证码"
                    self.smsBtn.isHidden = false
                }
            })
            .disposed(by: dispose)
        return btn
    }()
    
    lazy var forgotPwdBtn: UIButton = {
        let btn = DXUIKitFactory.createButton(title: "忘记密码", imgName: nil, imgBgName: nil, font: isregularFont(size: 13), titleColor: .darkGray, bgColor: .clear, superView: self)
        btn.isHidden = true
        btn.rx.tap
            .subscribe(onNext: {[unowned self] () in
                let vc = DXForgotVC()
                self.context?.present?.baseController?.navigationController?.pushViewController(vc, animated: true)
            })
            .disposed(by: dispose)
        return btn
    }()
    
    lazy var loginBtn: UIButton = {
        let btn = DXUIKitFactory.createButton(title: "登录", imgName: nil, imgBgName: nil, font: isregularFont(size: 13), titleColor: .white, bgColor: .red, superView: self)
        btn.rx.tap
            .subscribe(onNext: { () in
                DXLoginClient.manager.login(username: "17612159670", password: "123456") {[weak self] (model) in
                    guard let strongself = self else{ return }
                    if model.status == ReponseCode.sucsuss.rawValue{
                        DXLoginClient.manager.getUserInfo { (model) in
                            
                        }
                        let vc = DXTabbarVC()
//                        let nav = UINavigationController.init(rootViewController: vc)
//                        AppDelegate.sharedAppDelegate().window?.rootViewController = nav
                        strongself.basePresent?.baseController?.navigationController?.pushViewController(vc, animated: true)
                    }
                    else{
                        
                    }
                }
            })
            .disposed(by: dispose)
        return btn
    }()
    
    lazy var smsBtn: UIButton = {
        let btn = DXUIKitFactory.createButton(title: "获取验证码", imgName: nil, imgBgName: nil, font: isregularFont(size: 13), titleColor: .white, bgColor: .red, superView: self)
        btn.rx.tap
            .subscribe(onNext: { () in
                
            })
            .disposed(by: dispose)
        return btn
    }()
    
    lazy var createBtn: UIButton = {
        let btn = DXUIKitFactory.createButton(title: "创建账号", imgName: nil, imgBgName: nil, font: isregularFont(size: 13), titleColor: .darkGray, bgColor: .clear, superView: self)
        btn.rx.tap
            .subscribe(onNext: { () in
                
            })
            .disposed(by: dispose)
        return btn
    }()
       
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
