//
//  AppDelegate.swift
//  DuixinProject
//
//  Created by Taurus on 2020/2/19.
//  Copyright © 2020 xlk. All rights reserved.
//

import UIKit

import Alamofire


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
   var window: UIWindow?
    
    


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        MagicalRecord.setupCoreDataStack(withStoreNamed: "DX.sqlite")
        self.shareLocalization()
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        var vc: UIViewController!
        if let _ = UserDefault.object(forKey: DataKey.cookie.rawValue){
            vc = DXTabbarVC()
        }
        else{
            vc = DXLoginVC()
        }
        let nav = UINavigationController.init(rootViewController: vc)
        nav.isNavigationBarHidden = true
        window?.rootViewController = nav
        window?.clipsToBounds = true
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        MagicalRecord.cleanUp()
    }
    
    class func sharedAppDelegate() -> AppDelegate{
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    func shareLocalization(){
        if UserDefault.object(forKey: LOCALLANGUAGE) == nil{
            let lans:[String] = (UserDefault.object(forKey: "AppleLanguages") as! [String])
            let lan = lans.first
            if lan?.contains("zh-Hans") ?? false{
                UserDefault.set(CHINESE, forKey: LOCALLANGUAGE)
            }
            else{
                UserDefault.set(ENLISH, forKey: LOCALLANGUAGE)
            }
            UserDefault.synchronize()
        }
    }
}

