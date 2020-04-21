//  DXUserInfoModel.swift
//  DuixinProject
//  Created by Taurus on 2020/3/9.
//  Copyright © 2020 xlk. All rights reserved.
//

import UIKit
import HandyJSON

class DXUserInfoModel: HandyJSON {
    var status: Int = 0
    var msg: String = ""
    var data: DXUserInfoDataModel = DXUserInfoDataModel()
    
    required init() {}
}

class DXUserInfoDataModel: HandyJSON{
    var grade: DXGradeModel = DXGradeModel()
    var user: DXUserModel = DXUserModel()
    var raffle_unreceived_count: Int = 0
    var raffle_unfinished_count: Int = 0
    var raffle_create_count: Int = 0
    
    var vermicelli_count: Int = 0
    
    required init() {}
}

class DXUserModel: HandyJSON{
    
    var created_at: String = ""
    var short_video_follow_count :Int = 0
    var tag: String = ""
    var balance_digiccy: String = ""
    var short_video_fans_count: Int64 = 0
    
    var accept_sign_digiccy: String = ""
    var become_anchor_at: String = ""
    var username: String = ""
    var status: Int =  0
    var broadcast_integral: String = ""
    
    var gender: Int16 = 0
    var pinyin_name: String = ""
    var accept_balance_digiccy: String = ""
    var original_avatar: String = ""
    var id: Int64 = 0
    
    var cloud_user_id: String = ""
    var tel: Int16 = 0
    var invited_code: String = ""
    var updated_at: String = ""
    var sign_digiccy: String = ""
    
    var short_video_count: Int64 = 0
    var expend_digiccy: String = ""
    var short_video_collect_count: Int64 =   0
    var short_video_like_count: Int64 =   0
    var desc: String = ""
    
    var integral: String = ""
    var history_digiccy_count: String = ""
    var store_income: String = ""
    var rank: String = ""
    var anchor_operater: String = ""
    
    var audit_failed_cause: String = ""
    var email: String = ""
    var rank_value: Int = 0
    var avatar: String = ""
    var invite_code: String = ""
    
    var is_anchor: Int =   0
    var accept_expend_digiccy: String = ""
    var qr_code_url: String = ""
    var new_avatar: String = ""
    var short_video_status: Int = 0
    var source: String = ""
    
    required init() {}
}
