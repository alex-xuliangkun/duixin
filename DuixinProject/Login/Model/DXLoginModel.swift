//
//  DXLoginModel.swift
//  DuixinProject
//
//  Created by Taurus on 2020/3/5.
//  Copyright © 2020 xlk. All rights reserved.
//

import UIKit
import HandyJSON

class DXLoginModel: HandyJSON {
    var status: Int = 0
    var username:String = ""
    var password:String = ""
    var user_id: Int64 = 0
    var data: String = ""
    
    var grade: DXGradeModel = DXGradeModel()
    var avatar: String = ""
    var cookie: String = ""
    var group_id: String = ""
    var broadcast: Int64 = 0
    
    var oauths: DXOauthsModel = DXOauthsModel()
    
    required init() {}
}

class DXGradeModel: HandyJSON {
    var icon_path: String = ""
    var id: Int64 = 0
    var title: String = ""
    var min_value: Int64 = 0
    var icon: String = ""
    
    var grade_name: String = ""
    
    required init() {}
    
}

class DXOauthsModel: HandyJSON {
    var token_type: String = ""
    var expires_in: Int64 = 0
    var access_token: String = ""
    var refresh_token: String = ""
    required init(){}
}
