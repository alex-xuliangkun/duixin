//
//  DXUIImageEX.swift
//  DuixinProject
//
//  Created by Taurus on 2020/2/19.
//  Copyright © 2020 xlk. All rights reserved.
//

import Foundation
import UIKit

extension UIImage{
   class func iconWithInfo(iconText: String, iconSize: CGFloat, iconColor: UIColor?) -> UIImage {
    let size = iconSize - widthScale(value: 1)
    let imageSize = CGSize.init(width: iconSize, height: iconSize)
    UIGraphicsBeginImageContextWithOptions(imageSize, false, UIScreen.main.scale)
    let label = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: iconSize, height: iconSize))
    label.font = UIFont.init(name: "iconfont", size: size)
    label.text = iconText
    
    if let color = iconColor{
       label.textColor = color
    }
    label.layer.render(in: UIGraphicsGetCurrentContext()!)
    let retImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
    return retImage
   }
}
