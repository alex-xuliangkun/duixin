//
//  CommonHeader.swift
//  DuixinProject
//
//  Created by Taurus on 2020/2/19.
//  Copyright © 2020 xlk. All rights reserved.
//

import Foundation
import UIKit

let Screen_Scale = UIScreen.main.scale  // 屏幕分辨率
let statusBarHeight = UIApplication.shared.statusBarFrame.height;  //状态栏高度
let kScreenW = UIScreen.main.bounds.width  //屏幕宽度
let kScreenH = UIScreen.main.bounds.height  //屏幕高度

let ISIPHONE5 = (kScreenW == 320.0 && kScreenH == 568.0)
let ISIPHONE6 = (kScreenW == 375.0 && kScreenH == 667.0)
let ISIPHONE6p = (kScreenW == 414.0 && kScreenH == 736.0)
let ISIPHONEX = (kScreenW == 375.0 && kScreenH == 812.0)  //x  xs 11pro
let ISIPHONEXR = (kScreenW == 414.0 && kScreenH == 896.0) //xr  xsmax  11 11promax

let IPHONE_SCALE: CGFloat = kScreenW/375.0  //手机屏宽的比例

//MARK: - 版本号相关
let APP_VERSION = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String  // App版本号
let IOS_VERSION = UIDevice.current.systemVersion._bridgeToObjectiveC().doubleValue   // 系统版本
let BUILD_VERSION = Bundle.main.infoDictionary!["CFBundleVersion"] as! String  //
let IDFV = UIDevice.current.identifierForVendor?.uuidString

let bottomSafeAreaHeight =  (statusBarHeight > 20) ? 34 : 0//UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0.0  //底部的安全距离
let topSafeAreaHeight = CGFloat(bottomSafeAreaHeight == 0 ? 0 : 24)  //顶部的安全距离
let navigationHeight = CGFloat(bottomSafeAreaHeight == 0 ? 64 : 88)  //导航栏高度
let tabBarHeight = CGFloat(bottomSafeAreaHeight + 49)  //tabbar高度

// MARK: - 系统相关
func ISIPHONE() -> Bool {
    #if TARGET_IPHONE_SIMULATOR
        return false
    #else
        return true
    #endif
} //是否是真机

// MARK: - 颜色相关
func RGB(h:Int,alpha:CGFloat) ->UIColor {
    return RGBCOLOR(r: CGFloat(((h)>>16) & 0xFF), g:   CGFloat(((h)>>8) & 0xFF), b:  CGFloat((h) & 0xFF),alpha: alpha)
} //根据十六进制数生成颜色 HEXCOLOR(h:0xe6e6e6,alpha:0.8)

func RGBCOLOR(r:CGFloat,g:CGFloat,b:CGFloat,alpha:CGFloat) -> UIColor {
    return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alpha)
} //根据R,G,B生成颜色

func RANDOMCOLOR() -> UIColor {
    return RGBCOLOR(r: CGFloat(arc4random()%256), g: CGFloat(arc4random()%256), b: CGFloat(arc4random()%256),alpha: 1)
} //随机色

//MARK: - 时间戳转时间
func timeStampToString(timeStamp:Int64, dateFormat:String)->String {
    let timeSta:TimeInterval = TimeInterval(timeStamp)
    let dfmatter = DateFormatter()
    dfmatter.dateFormat = dateFormat //"yyyy-MM-dd HH:mm:ss"
    
    let date = Date.init(timeIntervalSince1970: timeSta)
    return dfmatter.string(from: date as Date)
}

func dataTimeStampToString(timeStamp:Int64, dateFormat:String)->String {
    let timeSta:TimeInterval = TimeInterval(timeStamp)
    let dfmatter = DateFormatter()
    dfmatter.dateStyle = .medium
    dfmatter.dateFormat = dateFormat
    let date = Date.init(timeIntervalSince1970: timeSta)
    let timestr = dfmatter.string(from: date as Date)
    let time = timestr.substring(startIndex: 9, endIndex: 14)
    var content: String = ""

    let calendar = Calendar.current
    let type: Set<Calendar.Component> = [.year, .month, .day]

    let cmps = calendar.dateComponents(type, from: date, to: Date.init())
    if cmps.year == 0 && cmps.month == 0 {
        if let day = cmps.day{
            if cmps.day == 0 {
                content = String.init(format: "今天 %@", time)
            }
            else if cmps.day == 1 {
                content = String.init(format: "昨天 %@", time)
            }
            else if cmps.day == 2 {
                content = String.init(format: "前天 %@", time)
            }
            else if day >= 3 && day <= 6{
                content = String.init(format: "%d天前", day)
            }
            else{
                let week = day/7
                content = String.init(format: "%d周前", week)
            }
        }
    }
   else if cmps.year == 0{
        if let month = cmps.month{
            content = String.init(format: "%d月前", month)
        }
    }
    else{
        if let year = cmps.year{
            content = String.init(format: "%d年前", year)
        }
    }
    return content
}

//MARK: - 版本
func version() -> Int{
    let version: String = UIDevice.current.systemVersion.replacingOccurrences(of: ".", with: "")
    if let a = Int(version){
        return a
    }
    else{
        return 1
    }
}

//MARK: - 字体
func isregularFont(size: CGFloat) -> UIFont{
    if IOS_VERSION > 9.0{
        return UIFont.init(name: "PingFangSC-Regular", size: size * CGFloat(IPHONE_SCALE))!
    }
    else{
        return UIFont.systemFont(ofSize: size * CGFloat(IPHONE_SCALE))
    }
}

func ismediumFont(size: CGFloat) -> UIFont{
    if IOS_VERSION > 9.0{
        return UIFont.init(name: "PingFangSC-Medium", size: size * CGFloat(IPHONE_SCALE))!
    }
    else{
        return UIFont.systemFont(ofSize: size * CGFloat(IPHONE_SCALE))
    }
}

func issemiboldFont(size: CGFloat) -> UIFont{
    if IOS_VERSION > 9.0{
        return UIFont.init(name: "PingFangSC-Semibold", size: size * CGFloat(IPHONE_SCALE))!
    }
    else{
        return UIFont.systemFont(ofSize: size * CGFloat(IPHONE_SCALE))
    }
}

func widthScale(value:Float) -> CGFloat{
    return ceil(CGFloat(value) * IPHONE_SCALE)
}

func ImageName(name:String) -> UIImage?{
    if let a = UIImage.init(named: name){
        return a
    }
    return nil
}

//MARK: - 常用初始化实例
let UserDefault = UserDefaults.standard

//MARK: - 本地化
let LANGUAGEKEY = "Language"
let ENLISH = "en"
let CHINESE = "zh-Hans"
let LOCALLANGUAGE = "LacolLanguage"
let CURLANGUAGE = UserDefault.object(forKey: LOCALLANGUAGE)

func Localized(key: String) -> String{
    let bun = Bundle.main
    let _ = bun.path(forResource: (CURLANGUAGE as! String), ofType: "lproj")
   return bun.localizedString(forKey: key, value: nil, table: "Localized")
}

//MARK: - DEBUG模式下打印(Swift)
func Dprint<T>(_ message: T, filePath: String = #file, rowCount: Int = #line) {
    #if DEBUG
    let fileName = (filePath as NSString).lastPathComponent.replacingOccurrences(of: ".swift", with: "")
    
    let dformatter = DateFormatter.init()
    dformatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
    let str = dformatter.string(from: Date.init())
    
    print("class:" + fileName + "  time:" + "\(str)" + " line:" + "\(rowCount)" + "  \(message)" + "\n")
    #endif
}


