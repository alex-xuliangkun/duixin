//
//  DXCustomButton.swift
//  DuixinProject
//
//  Created by Taurus on 2020/3/5.
//  Copyright © 2020 xlk. All rights reserved.
//

import UIKit

class DXCustomButton: UIButton {
    var contentImageFrame: CGRect!
    var contentImageSize: CGSize!
    var imagePositionType: CusBtnType = .DXCenter
    var contentTitleFrame: CGRect!
    var contentTitleSize: CGSize!
    var titlePositionType: CusBtnType = .DXCenter
    
    override func draw(_ rect: CGRect) {
        self.imageView?.contentMode = .scaleAspectFill
    }
    
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
       if contentImageFrame == nil || (self.contentImageFrame.size.height == 0 && self.contentImageFrame.size.width == 0
               && self.contentImageFrame.origin.y == 0 && self.contentImageFrame.origin.x == 0 ){
           var xv: CGFloat = 0.0
           var yv: CGFloat = 0.0
               
           switch(imagePositionType){
               case .DXCenter:
                   xv = (contentRect.size.width - contentImageSize.width)/2.0
                   yv = (contentRect.size.height - contentImageSize.height)/2.0
               case .DXLCenter:
                   xv = 0
                   yv = (contentRect.size.height - contentImageSize.height)/2.0
               case .DXRCenter:
                   xv = contentRect.size.width - contentImageSize.width
                   yv = (contentRect.size.height - contentImageSize.height)/2.0
               case .DXTCenter:
                   xv = (contentRect.size.width - contentImageSize.width)/2.0
                   yv = 0
               case .DXBCenter:
                   xv = (contentRect.size.width - contentImageSize.width)/2.0
                   yv = contentRect.size.height - contentImageSize.height
               default:
                   xv = 0
                   yv = (contentRect.size.height - contentImageSize.height)/2.0
           }
           let rect = CGRect.init(x: xv, y: yv, width: contentImageSize.width, height: contentImageSize.height)
           return rect
       }
       return self.contentImageFrame
   }
    
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        if (contentTitleFrame == nil || (self.contentTitleFrame.size.height == 0 && self.contentTitleFrame.size.width == 0
            && self.contentTitleFrame.origin.y == 0 && self.contentTitleFrame.origin.x == 0)){
            var xv: CGFloat = 0.0
            var yv: CGFloat = 0.0
            
            switch(titlePositionType){
            case .DXCenter:
                xv = (contentRect.size.width - contentTitleSize.width)/2.0
                yv = (contentRect.size.height - contentTitleSize.height)/2.0
            case .DXLCenter:
                xv = 0
                yv = (contentRect.size.height - contentTitleSize.height)/2.0
            case .DXRCenter:
                xv = contentRect.size.width - contentTitleSize.width
                yv = (contentRect.size.height - contentTitleSize.height)/2.0
            case .DXTCenter:
                xv = (contentRect.size.width - contentTitleSize.width)/2.0
                yv = 0
            case .DXBCenter:
                xv = (contentRect.size.width - contentTitleSize.width)/2.0
                yv = contentRect.size.height - contentTitleSize.height
            default:
                xv = contentRect.size.width - contentTitleSize.width
                yv = (contentRect.size.height - contentTitleSize.height)/2.0
            }
            let rect = CGRect.init(x: xv, y: yv, width: contentTitleSize.width, height: contentTitleSize.height)
            return rect
        }
        return self.contentTitleFrame
    }
}
