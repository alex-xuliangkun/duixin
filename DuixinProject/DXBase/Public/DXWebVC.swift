//  DXWebVC.swift
//  DuixinProject
//  Created by Taurus on 2020/3/12.
//  Copyright © 2020 xlk. All rights reserved.
//  H5

import UIKit
import WebKit

class DXWebVC: DXBaseVC {
    private var webView = WKWebView.init()
    var loadStr:String = ""
    var titleStr:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.clearCache()

    }
    
    func setWebUI(){
        self.webView.scrollView.showsVerticalScrollIndicator = false
        self.webView.scrollView.showsHorizontalScrollIndicator = false
        self.webView.scrollView.bounces = false
        webView.autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.flexibleHeight.rawValue | UIView.AutoresizingMask.flexibleWidth.rawValue)
        webView.isMultipleTouchEnabled = true
        webView.autoresizesSubviews = true
        webView.scrollView.alwaysBounceVertical = true
        
        var myRequest = URLRequest(url: URL.init(string: loadStr)!)
        myRequest.cachePolicy = .reloadIgnoringLocalCacheData
        webView.navigationDelegate = self
        webView.uiDelegate = self
        webView.scrollView.backgroundColor = .white
        self.view.addSubview(webView)
        webView.load(myRequest)
    }
    
    //MARK: - 清除缓存
    func clearCache(){
        if #available(iOS 9.0, *) {
            let websiteDataTypes = WKWebsiteDataStore.allWebsiteDataTypes()
            let dateFrom = Date.init(timeIntervalSince1970: 0)
            WKWebsiteDataStore.default().removeData(ofTypes: websiteDataTypes, modifiedSince: dateFrom) {
                Dprint("缓存清除")
            }
        } else {
            Dprint("缓存清除1")
        }
    }
}

extension DXWebVC: WKNavigationDelegate,WKUIDelegate,UIScrollViewDelegate,WKScriptMessageHandler{
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
    }
}
