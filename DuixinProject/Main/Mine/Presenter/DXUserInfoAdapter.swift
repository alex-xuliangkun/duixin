//
//  DXUserInfoAdapter.swift
//  DuixinProject
//
//  Created by Taurus on 2020/3/7.
//  Copyright © 2020 xlk. All rights reserved.
//

import UIKit

class DXUserInfoAdapter: DXBaseAdapter {
    var titles: [String] = [UserInfoPage.headerName.rawValue,UserInfoPage.nickName.rawValue,UserInfoPage.phoneName.rawValue]
    
    override init() {
        super.init()
        
        
    }

}

extension DXUserInfoAdapter: UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: DXUserInfoTableViewCell? = tableView.dequeueReusableCell(withIdentifier: UserInfoPage.infocellIdentifier.rawValue) as? DXUserInfoTableViewCell
        if cell == nil{
            cell = DXUserInfoTableViewCell.init(style: .default, reuseIdentifier: UserInfoPage.infocellIdentifier.rawValue)
        }
        if let user = UserInfo.mr_findFirst(){
            cell?.titleL.text = titles[indexPath.row]
            if indexPath.row == 0{
                cell?.headerIcon.isHidden = false
                cell?.contentL.isHidden = true
                cell?.headerIcon.setImageWith(URL.init(string: user.avatar!), placeholder: UIImage.init(named: ""))
            }
            else{
               cell?.headerIcon.isHidden = true
               cell?.contentL.isHidden = false
                if indexPath.row == 1{
                    cell?.contentL.text = user.username!
                }
                else{
                    cell?.contentL.text = "1877"
                }
            }
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return widthScale(value: 80)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if let delegate = self.delegate{
            delegate.didSelectCell(type: .userInfoTablePop,indexpath: indexPath)
        }
    }
}



