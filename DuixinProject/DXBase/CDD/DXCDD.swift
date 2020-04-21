//
//  DXCDD.swift
//  DuixinProject
//
//  Created by Taurus on 2020/2/19.
//  Copyright © 2020 xlk. All rights reserved.
//

import Foundation
import UIKit

struct NSObjcCategoriesKeys {
    static var context : DXBaseContext = DXBaseContext()
    static var tableManager: DXTableManager = DXTableManager()
}

extension NSObject{
    var context: DXBaseContext? {
        set(newValue) {
            objc_setAssociatedObject(self, &NSObjcCategoriesKeys.context, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
        get {
            var curContext = objc_getAssociatedObject(self, &NSObjcCategoriesKeys.context) as? DXBaseContext
            if(curContext == nil && self.isKind(of: UIView.classForCoder())){
                let view = self as! UIView
                var sprView = view.superview
                while sprView != nil {
                    if sprView?.context != nil{
                        curContext = sprView?.context
                        break
                    }
                    sprView = sprView?.superview
                }
                if curContext != nil{
                    self.context = curContext
                }
            }
            return  curContext
        }
    }
}


