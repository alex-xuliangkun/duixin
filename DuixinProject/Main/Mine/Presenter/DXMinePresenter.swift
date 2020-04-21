//  DXMinePresenter.swift
//  DuixinProject
//  Created by Taurus on 2020/3/5.
//  Copyright © 2020 xlk. All rights reserved.
//

import UIKit

class DXMinePresenter: DXBasePresenter {
    func loadDataWithAdapter(adapter: DXBaseAdapter){
        if let user = UserInfo.mr_findFirst(){
            let arr = ["\(user.short_video_fans_count)", "\(user.short_video_fans_count)",user.accept_balance_digiccy]
            
            adapter.setAdapterArray(data: arr as [Any])
            
            let view: DXMineView = self.baseView as! DXMineView
            view.reloadUIWithData()
        }
    }

}
