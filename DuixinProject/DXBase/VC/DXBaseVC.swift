//
//  DXBaseVC.swift
//  DuixinProject
//
//  Created by Taurus on 2020/2/19.
//  Copyright © 2020 xlk. All rights reserved.
//

import UIKit

class DXBaseVC: UIViewController {
    
    let baseNavV = UIView.init()
    var baseBackBtn = UIButton.init(type: .custom)
    let baseTitleL = UILabel.init()
    var baseRightBtn: UIButton!

    var mvpEnabled = false
    var rootContext = DXBaseContext()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        if mvpEnabled{
            self.context?.view?.frame = self.view.bounds
            self.view = self.context?.view
        }
    }
    
    func configMVP(name:String){
        self.mvpEnabled = true
        self.context = rootContext
        
        if let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String {
            let presenterStr = String.init(format: "DX%@Presenter", name)
            if let presenterClass = NSClassFromString(clsName + "." + presenterStr) as? DXBasePresenter.Type{
                self.context?.present = presenterClass.init()
                self.context?.present?.context = self.context
            }
        
            let interactorStr = String.init(format: "DX%@Interactor", name)
            if let interactorClass = NSClassFromString(clsName + "." + interactorStr) as? DXBaseInteractor.Type{
                self.context?.interactor = interactorClass.init()
                self.context?.interactor?.context = self.context
            }
        
            let viewStr = String.init(format: "DX%@View", name)
            if let viewClass = NSClassFromString(clsName + "." + viewStr) as? DXBaseView.Type{
                self.context?.view = viewClass.init()
                self.context?.view?.context = self.context
            }
                    
            self.context?.present?.baseController = self
            self.context?.present?.baseView = self.context?.view

            self.context?.interactor?.baseController = self

            self.context?.view?.basePresent = self.context?.present
            self.context?.view?.baseInteractor = self.context?.interactor
            
        }
    }
    
    //MARK: - 基础方法
    func setNavTitle(title:String,titleColor:UIColor){
        baseNavV.frame = CGRect.init(x: 0, y: 0, width: kScreenW, height: navigationHeight)
        baseNavV.backgroundColor = .white
        self.view.addSubview(baseNavV)
        
        let backIcon: UIImage = UIImage.iconWithInfo(iconText: "\u{e618}", iconSize: 15, iconColor: tabBarColor_nor)
        let width = navigationHeight - statusBarHeight
        let rect = CGRect.init(x: 0, y: statusBarHeight, width: width, height: width)
        baseBackBtn.frame = rect
        baseBackBtn.setImage(backIcon, for: .normal)
        baseBackBtn.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        baseNavV.addSubview(baseBackBtn)
        
        baseRightBtn = DXUIKitFactory.createButton(title: "", imgName: nil, imgBgName: nil, font: isregularFont(size: 16), titleColor: .darkGray, bgColor: .clear, superView: baseNavV)
        baseRightBtn.isHidden = true
        baseRightBtn.addTarget(self, action: #selector(rightAction), for: .touchUpInside)
        baseRightBtn.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.height.equalTo(navigationHeight - topSafeAreaHeight - 20)
            make.right.equalTo(widthScale(value: -5))
            make.width.equalTo(widthScale(value: 80))
        }
        
        baseTitleL.frame = CGRect.init(x: width, y: statusBarHeight, width: kScreenW - 2 * width, height: width)
        baseTitleL.text = title
        baseTitleL.textColor = titleColor
        baseTitleL.textAlignment = .center
        baseTitleL.font = isregularFont(size: 17)
        baseNavV.addSubview(baseTitleL)
        
        let line = UIView.init(frame: CGRect.init(x: 0, y: navigationHeight - 0.5, width: kScreenW, height: 0.5))
        line.backgroundColor = RGB(h: 0xE5E2E2, alpha: 1)
        baseNavV.addSubview(line)
    }
    
    @objc func backAction(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func rightAction(){
        
    }
}
