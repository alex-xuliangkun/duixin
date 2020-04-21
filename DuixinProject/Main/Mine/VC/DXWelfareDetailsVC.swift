//
//  DXWelfareDetailsVC.swift
//  DuixinProject
//  Created by Taurus on 2020/3/12.
//  Copyright © 2020 xlk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class DXWelfareDetailsVC: DXBaseVC {
    var pageVc:UIPageViewController!
    let dispose = DisposeBag()
    var currentIndex: Int = 0
    let incomeBtn = UIButton.init(type: .custom)
    let spendBtn = UIButton.init(type: .custom)
    
    var viewControllers: [UIViewController] {
        return [DXWelfareIncomeVC(), DXWelfareSpendVC()]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNav()
        self.setPageUI()
    }
    
    func setNav(){
        let backIcon: UIImage = UIImage.iconWithInfo(iconText: "\u{e618}", iconSize: 15, iconColor: tabBarColor_nor)
        let width = navigationHeight - statusBarHeight
        let rect = CGRect.init(x: 0, y: statusBarHeight, width: width, height: width)
        let backBtn = UIButton.init(type: .custom)
        backBtn.frame = rect
        backBtn.setImage(backIcon, for: .normal)
        self.view.addSubview(backBtn)
        backBtn.rx.tap
            .subscribe(onNext: {[weak self] () in
                guard let strongself = self else{return}
                strongself.navigationController?.popViewController(animated: true)
            })
        .disposed(by: dispose)
        
        incomeBtn.setTitle("福利收入", for: .normal)
        incomeBtn.setTitleColor(tabBarColor_nor, for: .normal)
        incomeBtn.setTitleColor(tabBarColor_sel, for: .selected)
        incomeBtn.isSelected = true
        self.view.addSubview(incomeBtn)
        incomeBtn.snp.makeConstraints { (make) in
            make.right.equalTo(self.view.snp.centerX).offset(widthScale(value: -10))
            make.top.equalTo(statusBarHeight)
            make.width.equalTo(widthScale(value: 100))
            make.height.equalTo(navigationHeight - statusBarHeight)
        }
        incomeBtn.rx.tap
            .subscribe(onNext: {[weak self] () in
                guard let strongself = self else{return}
                strongself.currentIndex = 0
                strongself.pageVc.setViewControllers([strongself.viewControllers[strongself.currentIndex]], direction: .forward, animated: true, completion: nil)
                strongself.incomeBtn.isSelected = true
                strongself.spendBtn.isSelected = false
                
            })
        .disposed(by: dispose)
        
        spendBtn.setTitle("福利支出", for: .normal)
        spendBtn.setTitleColor(tabBarColor_nor, for: .normal)
        spendBtn.setTitleColor(tabBarColor_sel, for: .selected)
        spendBtn.isSelected = false
        self.view.addSubview(spendBtn)
        spendBtn.snp.makeConstraints { (make) in
            make.left.equalTo(self.view.snp.centerX).offset(widthScale(value: 10))
            make.top.equalTo(statusBarHeight)
            make.width.equalTo(widthScale(value: 100))
            make.height.equalTo(navigationHeight - statusBarHeight)
        }
        spendBtn.rx.tap
            .subscribe(onNext: {[weak self] () in
                guard let strongself = self else{return}
                strongself.currentIndex = 1
                strongself.pageVc.setViewControllers([strongself.viewControllers[strongself.currentIndex]], direction: .forward, animated: true, completion: nil)
                strongself.incomeBtn.isSelected = false
                strongself.spendBtn.isSelected = true
            })
        .disposed(by: dispose)
        
    }
    
    func setPageUI(){
        pageVc = UIPageViewController.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageVc.delegate = self
        pageVc.dataSource = self
        self.addChild(pageVc)
        pageVc.view.frame = CGRect.init(x: 0, y: navigationHeight, width: kScreenW, height: kScreenH - navigationHeight)
        self.view.addSubview(pageVc.view)
        pageVc.didMove(toParent: self)
        
        pageVc.setViewControllers([viewControllers[currentIndex]], direction: .forward, animated: true, completion: nil)
    }
}

extension DXWelfareDetailsVC: UIPageViewControllerDelegate,UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if currentIndex - 1 >= 0 {
            currentIndex -= 1
            incomeBtn.isSelected = true
            spendBtn.isSelected = false
            return viewControllers[currentIndex]
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if currentIndex + 1 < viewControllers.count {
            currentIndex += 1
            incomeBtn.isSelected = false
            spendBtn.isSelected = true
            return viewControllers[currentIndex]
        }
        return nil
    }
    
    
}


