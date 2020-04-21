//
//  DXMineVC.swift
//  DuixinProject
//
//  Created by Taurus on 2020/3/5.
//  Copyright © 2020 xlk. All rights reserved.
//

import UIKit

class DXMineVC: DXBaseVC {
    let adapter = DXMineAdapter.init()

    override func viewDidLoad() {
        self.configMVP(name: "Mine")
        super.viewDidLoad()
        
        adapter.delegate = self
        let mineview: DXMineView = self.context?.view as! DXMineView
        mineview.buildMineView(adapter: adapter)
        
        self.setNavTitle(title: MinePage.title.rawValue, titleColor: .darkGray)
    }
}

extension DXMineVC: DXBaseAdapterProtocol{
    func didSelectCell(type: PopType, indexpath: IndexPath) {
        switch type {
        case .mineTablePop:
            break
        default:
            if indexpath.row == 0{
                let vc = DXFansVC()
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else if indexpath.row == 1{
                let vc = DXVideosVC()
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else{
               let vc = DXWelfareVC()
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}
