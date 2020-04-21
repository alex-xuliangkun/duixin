//
//  DXStringEX.swift
//  DuixinProject
//
//  Created by Taurus on 2020/2/19.
//  Copyright © 2020 xlk. All rights reserved.
//

import Foundation
import UIKit

extension String{
    //   取子字符串
    //   - Parameters:
    //   - startIndex: 开始位置索引
    //   - endIndex: 结束位置索引
    //   - Returns: 从开始位置到结束位置的前一个位置上的字符串
    func substring(startIndex:Int, endIndex:Int) -> String {
        let start = self.index(self.startIndex, offsetBy: startIndex)  //索引从开始偏移startIndex个位置
        let end = self.index(self.startIndex, offsetBy: endIndex)  //索引从开始偏移endIndex个位置
        return String(self[start..<end])
    }
    
    //将原始的url编码为合法的url
   func urlEncoded() -> String {
       let encodeUrlString = self.addingPercentEncoding(withAllowedCharacters:.urlQueryAllowed)
       return encodeUrlString ?? ""
   }
       
   //将编码后的url转换回原始的url
   func urlDecoded() -> String {
       return self.removingPercentEncoding ?? ""
   }
    
   //MARK: -判断只含数字和字符
   func stringNumberAndchar(string:String) -> Bool{
       let regex = "^[a-zA-Z0-9]+$"
       let regextestmobile: NSPredicate = NSPredicate(format: "SELF MATCHES %@", regex)
       if(regextestmobile.evaluate(with: string) == true){
           return true
       }
       else{
           return false
       }
   }
    
    //MARK: -计算字符串高度
//    func getLabelHeight(font:UIFont,width:CGFloat) -> CGFloat{
//        let rect = NSString(string: self).boundingRect(with: CGSize.init(width: width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
//        return rect.height
//    }
    
//    func getLabelWidth(font:UIFont,width:CGFloat) -> CGFloat{
//        let rect = NSString(string: self).boundingRect(with: CGSize.init(width: width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
//        return rect.width
//    }
}


