//  DXEnumMarco.swift
//  DuixinProject
//  Created by Taurus on 2020/2/20.
//  Copyright © 2020 xlk. All rights reserved.
//

import Foundation

enum Forgot_registerType: Int{
    case forgot          //忘记密码
    case register        //注册
}

enum CusBtnType: Int{
   case DXDefault  //默认位置
   case DXCenter   //居中
   case DXRCenter  //靠右居中
   case DXLCenter  //靠左居中
   case DXTCenter //顶部居中
   case DXBCenter  //底部剧中
}

//MARK: - 数据存储键
enum DataKey: String{
    case cookie = "cookie"
}

//MARK: - 请求码
enum ReponseCode: Int{
    case sucsuss = 200
}

//MARK: - TabBar文本数据
enum TabBarName: String{
    case home = "首页"
    case im = "社交"
    case shop = "购物车"
    case mine = "我的"
}

//MARK: - 我的界面文本
enum MinePage: String{
    case title = "我的"
    case fans = "粉丝"
    case video = "视频"
    case welfare = "福利"
    
    case lucky = "我的抽奖"
    case order = "我的订单"
    case cooperation = "合作认证"
    case about = "关于兑幸"
    case setting = "设置"
    
    case userinfo = "个人信息"
    
    case fanscellIdentifier = "fanscellIdentifier"
    case minecellIdentifier = "minecellIdentifier"
}

//MARK: - 个人信息界面
enum UserInfoPage: String {
    case headerName = "头像"
    case nickName = "昵称"
    case phoneName = "手机号"
    case registereTime = "注册时间: "
    case infocellIdentifier = "userInfoPagecellIdentifier"
}

enum PopType: String{
    case mineTablePop = "minetablePopIdentifier"
    case mineCollectionPop = "minecollectionPopIdentifier"
    
    case userInfoTablePop = "userInfoTablePop"
}

//MARK: -
enum HomeName: String{
    case homeTitle = "首页"
}
