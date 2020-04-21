//  DXUserInfoVC.swift
//  DuixinProject
//  Created by Taurus on 2020/3/6.
//  Copyright © 2020 xlk. All rights reserved.
//  个人信息界面

import UIKit
import RxSwift
import RxCocoa

class DXUserInfoVC: DXBaseVC {
    let adapter = DXUserInfoAdapter.init()
    let cameraView = DXCameraView.init()
    let interactor = DXUserInfoInteractor.init()
    let dispose = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        self.setNavTitle(title: MinePage.userinfo.rawValue, titleColor: tabBarColor_nor)
        
        interactor.vc = self
        
        self.view.addSubview(self.table)
        self.table.dataSource = adapter
        self.table.delegate = adapter
        adapter.delegate = self
        
        let footerV = UIView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenW, height: widthScale(value: 40)))
        self.table.tableFooterView = footerV
        
        let registerL = DXUIKitFactory.createLabel(text: "", font: isregularFont(size: 12), textColor: .darkGray, alignment: .center, superView: footerV)
        registerL.snp.makeConstraints { (make) in
            make.center.width.equalToSuperview()
            make.height.equalTo(widthScale(value: 20))
        }
        if let user = UserInfo.mr_findFirst(){
            let text: String = UserInfoPage.registereTime.rawValue + "\(88)"
            registerL.text = text
        }
    }
    
    //MARK: - 控件
    lazy var table: UITableView = {
        let tableview = UITableView.init(frame: CGRect.init(x: 0, y: navigationHeight, width: kScreenW, height: kScreenH - navigationHeight), style: UITableView.Style.plain)
        tableview.clipsToBounds = false
        tableview.separatorStyle = .none
        return tableview
    }()
}

extension DXUserInfoVC: DXBaseAdapterProtocol{
    func didSelectCell(type: PopType, indexpath: IndexPath) {
        switch type {
        case .userInfoTablePop:
            if indexpath.row == 0{
                cameraView.frame = self.view.bounds
                cameraView.delegate = interactor
                self.view.addSubview(cameraView)
            }
            else if indexpath.row == 1{
                let vc = DXNickNameChangeVC.init()
                self.navigationController?.pushViewController(vc, animated: true)
            }
        default:
            break
        }
    }
}
