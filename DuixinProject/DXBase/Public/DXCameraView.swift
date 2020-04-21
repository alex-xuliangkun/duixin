//  DXCameraView.swift
//  DuixinProject
//  Created by Taurus on 2020/3/10.
//  Copyright © 2020 xlk. All rights reserved.
//  相机

import UIKit
import RxSwift
import RxCocoa

protocol DXCameraViewProtocal {
    func didPhote()
    func didCamera()
    func didCancle()
}

class DXCameraView: UIView {
    let popView = UIView.init()
    var delegate: DXCameraViewProtocal?
    let dispose = DisposeBag()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = RGB(h: 0x000000, alpha: 0.5)
        
        self.addSubview(popView)
        popView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalToSuperview()
            make.height.equalTo(widthScale(value: 120))
        }
        popView.backgroundColor = .white
        
        
        
        let photebtn = DXUIKitFactory.createButton(title: "相册", imgName: nil, imgBgName: nil, font: isregularFont(size: 15), titleColor: .darkGray, bgColor: .clear, superView: popView)
        photebtn.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(widthScale(value: 40))
        }
        photebtn.rx.tap
            .subscribe(onNext: {[weak self] () in
                guard let strongself = self else{return}
                if let delegate = strongself.delegate{
                    delegate.didPhote()
                }
            })
            .disposed(by: dispose)
        
        let camerabtn = DXUIKitFactory.createButton(title: "相机", imgName: nil, imgBgName: nil, font: isregularFont(size: 15), titleColor: .darkGray, bgColor: .clear, superView: popView)
        camerabtn.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalTo(widthScale(value: 40))
            make.top.equalTo(widthScale(value: 40))
        }
        camerabtn.rx.tap
            .subscribe(onNext: { [weak self] () in
                guard let strongself = self else{return}
                if let delegate = strongself.delegate{
                    delegate.didCamera()
                }
            })
            .disposed(by: dispose)
        
        let canclebtn = DXUIKitFactory.createButton(title: "取消", imgName: nil, imgBgName: nil, font: isregularFont(size: 15), titleColor: .darkGray, bgColor: .clear, superView: popView)
        canclebtn.snp.makeConstraints { (make) in
            make.left.bottom.right.equalToSuperview()
            make.height.equalTo(widthScale(value: 40))
        }
        canclebtn.rx.tap
            .subscribe(onNext: {[weak self] () in
                guard let strongself = self else{return}
                if let delegate = strongself.delegate{
                    delegate.didCancle()
                }
            })
        .disposed(by: dispose)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
