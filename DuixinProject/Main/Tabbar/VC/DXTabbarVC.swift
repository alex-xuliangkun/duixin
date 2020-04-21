//
//  DXTabbarVC.swift
//  DuixinProject
//
//  Created by Taurus on 2020/3/5.
//  Copyright © 2020 xlk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class DXTabbarVC: UIViewController {
    let contentV = UIView.init()
    let tabBarV = UIView.init()
    var selectorIndex: Int = 0
    var viewcontrollers: [UIViewController]!
    let dispose = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        
        self.view.addSubview(contentV)
        contentV.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
            make.bottom.equalTo(-tabBarHeight)
        }
        contentV.backgroundColor = .red
        
        self.view.addSubview(tabBarV)
        tabBarV.snp.makeConstraints { (make) in
            make.left.bottom.right.equalToSuperview()
            make.height.equalTo(tabBarHeight)
        }
        tabBarV.backgroundColor = .white
        
        let vcs = [DXHomeVC(),DXImVC(),DXShopVC(), DXMineVC()]
        self.setViewcontrollers(vcs: vcs)
        
        let titles: [TabBarName] = [.home,.im,.shop,.mine]
        let imageselectors = [UIImage.iconWithInfo(iconText: "\u{e687}", iconSize: 15, iconColor: tabBarColor_sel),
                              UIImage.iconWithInfo(iconText: "\u{e687}", iconSize: 15, iconColor: tabBarColor_sel),
                              UIImage.iconWithInfo(iconText: "\u{e695}", iconSize: 15, iconColor: tabBarColor_sel),
                              UIImage.iconWithInfo(iconText: "\u{e693}", iconSize: 15, iconColor: tabBarColor_sel)]
        let imagenors = [UIImage.iconWithInfo(iconText: "\u{e621}", iconSize: 15, iconColor: tabBarColor_nor),
                         UIImage.iconWithInfo(iconText: "\u{e687}", iconSize: 15, iconColor: tabBarColor_nor),
                         UIImage.iconWithInfo(iconText: "\u{e655}", iconSize: 15, iconColor: tabBarColor_nor),
                         UIImage.iconWithInfo(iconText: "\u{e66e}", iconSize: 15, iconColor: tabBarColor_nor)]
        
        var rect = CGRect.init(x: 0, y: widthScale(value: 5), width: kScreenW/4.0, height: tabBarHeight - widthScale(value: 5) - CGFloat(bottomSafeAreaHeight))
        let w = widthScale(value: 23)
        let h = widthScale(value: 23)
        
        for i in 0..<4{
            let btn = DXCustomButton.init(frame: rect)
            btn.setTitle(titles[i].rawValue, for: .normal)
            btn.setTitleColor(tabBarColor_nor, for: .normal)
            btn.setTitleColor(tabBarColor_sel, for: .selected)
           btn.setImage(imagenors[i], for: .normal)
           btn.setImage(imageselectors[i], for: .selected)
           btn.tag = i + 1000
           btn.titlePositionType = .DXBCenter
           btn.imagePositionType = .DXTCenter
           btn.contentImageSize = CGSize.init(width: w, height: h)
           btn.contentTitleSize = CGSize.init(width: rect.size.width, height: widthScale(value: 10))
           btn.titleLabel?.font = isregularFont(size: 9)
           btn.titleLabel?.textAlignment = .center
           tabBarV.addSubview(btn)
           if i == selectorIndex{
               let toViewController = viewcontrollers[selectorIndex]
               contentV.addSubview(toViewController.view)
               btn.isSelected = true
           }
           rect.origin.x = CGFloat(i + 1) * (kScreenW/4.0)
            
           btn.rx.tap
              .subscribe(onNext: { [weak self]() in
                guard let strongself = self else{return}
                let index = btn.tag - 1000
                if(index >= 0 && index < strongself.viewcontrollers.count){
                   if(index == strongself.selectorIndex){
                        return
                   }
                   let fromViewController = strongself.viewcontrollers[strongself.selectorIndex]
                   let oldbtn: DXCustomButton = strongself.tabBarV.viewWithTag(strongself.selectorIndex + 1000) as! DXCustomButton
                   oldbtn.isSelected = false
                   btn.isSelected = true
                   strongself.selectorIndex = index
                   let toViewController = strongself.viewcontrollers[strongself.selectorIndex]
                   fromViewController.view.removeFromSuperview()
                   strongself.contentV.addSubview(toViewController.view)
                }
              })
              .disposed(by: dispose)
        }
    }
    
    fileprivate func setViewcontrollers(vcs:[UIViewController]){
         for obj in vcs{
            obj.willMove(toParent: nil)
            obj.removeFromParent()
         }
         viewcontrollers = vcs
         for newvc in viewcontrollers{
            self.addChild(newvc)
            newvc.didMove(toParent: self)
         }
     }
}
