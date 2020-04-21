//
//  DXUIKitFactory.swift
//  DuixinProject
//
//  Created by Taurus on 2020/2/19.
//  Copyright © 2020 xlk. All rights reserved.
//

import UIKit

class DXUIKitFactory: NSObject {
    
    /**
        *  生成UILabel
        *  @param frame          位置
        *  @param text           文字
        *  @param font           字体大小
        *  @param titleColor     字体颜色
        *  @param superView      父试图
        *  @return UILabel
        */
       class func createLabel(text:String,font:UIFont,textColor:UIColor,alignment:NSTextAlignment,superView:UIView) -> UILabel{
           let lable = UILabel.init()
           lable.text = text
           lable.font = font
           lable.textAlignment = alignment
           lable.textColor = textColor
           superView.addSubview(lable)
           return lable
       }
    
    /**
    *  生成上下
    *  @param text           文字
    *  @param font           字体大小
    *  @param titleColor     字体颜色
    *  @param superView      父试图
    *  @return UILabel
    */
    class func createTwoLabel(numtext:String, name:String,font:UIFont, subfont:UIFont, textColor:UIColor,subColor:UIColor, alignment:NSTextAlignment, frame:CGRect,superView:UIView) -> UILabel{
        var rect = frame
        
        let lable = UILabel.init()
        lable.text = numtext
        lable.font = font
        lable.frame = frame
        lable.textAlignment = alignment
        lable.textColor = textColor
        superView.addSubview(lable)
        
        rect.origin.y = frame.origin.y + frame.size.height + widthScale(value: 3)
        let subtitle = UILabel.init()
        subtitle.text = name
        subtitle.font = subfont
        subtitle.frame = rect
        subtitle.textAlignment = alignment
        subtitle.textColor = subColor
        superView.addSubview(subtitle)
        
        return lable
    }
    
       
       /**
        *  生成GradientLabel
        *  @param text           文字
        *  @param font           字体大小
        *  @param titleColor     字体颜色
        *  @param superView      父试图
        *  @return UILabel
        */
//       class func createGradientLabel(text:String,font:UIFont,textColor:UIColor,alignment:NSTextAlignment,superView:UIView) -> GradientLabel{
//           let lable = GradientLabel.init()
//           lable.text = text
//           lable.font = font
//           lable.textAlignment = alignment
//           lable.textColor = textColor
//           superView.addSubview(lable)
//           return lable
//       }
       
    /**
        *  生成UIButton
        *  @param frame          位置
        *  @param title          标题
        *  @param imgName        图片名字
        *  @param imgBgName      背景图片名字
        *  @param font           字体大小
        *  @param titleColor     字体颜色
        *  @param bgColor        背景颜色
        *  @param superView      父试图
        *  @return UIButton
        */
       class func createButton(title:String,imgName:String?,imgBgName:String?,font:UIFont,titleColor:UIColor,bgColor:UIColor,superView:UIView) -> UIButton{
           let btn = UIButton.init(type: .custom)
           if let img = imgName{
               btn.setImage(UIImage.init(named: img), for: .normal)
           }
        if let img = imgBgName{
           btn.setBackgroundImage(UIImage.init(named: img), for: .normal)
        }
           btn.setTitle(title, for: .normal)
           btn.setTitleColor(titleColor, for: .normal)
           btn.titleLabel?.font = font
           btn.backgroundColor = bgColor
           superView.addSubview(btn)
           return btn
       }
    
    /**
     *  生成CustomButton
     *  @param frame          位置
     *  @param title          标题
     *  @param imgName        图片名字
     *  @param imgBgName      背景图片名字
     *  @param font           字体大小
     *  @param titleColor     字体颜色
     *  @param bgColor        背景颜色
     *  @param superView      父试图
     *  @return UIButton
     */
//    class func createCustomButton(frame:CGRect,title:String,imgName:String,imgBgName:String,font:UIFont,titleColor:UIColor,bgColor:UIColor,imgType:ButtonPositionType,imgFrame:CGRect,titleType:ButtonPositionType,titleFrame:CGRect,superView:UIView) -> UIButton{
//        let btn = CustomButton.init(type: .custom)
//        btn.frame = frame
//        btn.contentImageFrame = imgFrame
//        btn.imagePositionType = imgType
//        btn.contentTitleFrame = titleFrame
//        btn.titlePositionType = titleType
//        btn.titleLabel?.textAlignment = .center
//        btn.backgroundColor = bgColor
//        btn.setImage(UIImage.init(named: imgName), for: .normal)
//        btn.setBackgroundImage(UIImage.init(named: imgBgName), for: .normal)
//        btn.setTitle(title, for: .normal)
//        btn.setTitleColor(titleColor, for: .normal)
//        btn.titleLabel?.font = font
//        superView.addSubview(btn)
//        return btn
//    }
    
    /**
     *  生成UIView
     *  @param frame          位置
     *  @param bgColor        背景颜色
     *  @param superView      父试图
     *  @return UIView
     */
    class func createView(frame:CGRect,radius:CGFloat,color:UIColor,superView:UIView) -> UIView{
        let v = UIView.init(frame: frame)
        v.backgroundColor = .white
        v.layer.borderColor = color.cgColor
        v.layer.borderWidth = 0.5
        v.layer.cornerRadius = radius
        v.layer.masksToBounds = true
        superView.addSubview(v)
        return v
    }
    
    class func createLine(frame:CGRect,superView:UIView) {
        let v = UIView.init(frame: frame)
        v.backgroundColor = .darkGray
        superView.addSubview(v)
    }
    
    /**
    *  生成 UITextField
    *  @param bgColor        背景颜色
    *  @param superView      父试图
    *  @return UIView
    */
    class func createTextField(placeholder:String,textColor:UIColor,font:UIFont,borderStyle:UITextField.BorderStyle,superView:UIView) -> UITextField{
        let tf = UITextField.init()
        tf.placeholder = placeholder
        tf.textColor = textColor
        tf.font = font
        tf.borderStyle = borderStyle
        superView.addSubview(tf)
        return tf
    }
    
    /**
     *  生成 UISwitch
     *  @param bgColor        背景颜色
     *  @param superView      父试图
     *  @return UISwitch
     */
    class func createSwitch(isOn:Bool, superView:UIView) -> UISwitch{
        let btn = UISwitch.init()
        btn.isOn = true
        superView.addSubview(btn)
        
        return btn
    }
    
    /**
     *  生成 YYTextView
     *  @param textColor        背景颜色
     *  @param font            字体
     *  @param placeholderText        提示文本
     *  @param superView      父试图
     *  @return YYTextView
     */
//    class func createYYText(textColor:UIColor,font:UIFont,placeholderText: String,superView:UIView) -> YYTextView{
//        let text = YYTextView.init()
//        text.textColor = textColor
//        text.font = font
//        text.placeholderText = placeholderText
//        text.text = placeholderText
//        text.placeholderFont = UIFont.systemFont(ofSize: 14)
//        text.placeholderTextColor = RGB(h: 0xBEBBBB, alpha: 1)
//        superView.addSubview(text)
//        return text
//    }
    
    
//    class func createAlertView(title:String,message:String,complation:@escaping ()->(),cancle:@escaping ()->()){
//        let vc = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
//        let cancelAction = UIAlertAction.init(title: "取消", style: .cancel) { (action) in
//            cancle()
//        }
//        let btn = UIAlertAction.init(title: "确定", style: .default) { (action) in
//            complation()
//        }
//        vc.addAction(cancelAction)
//        vc.addAction(btn)
//        UIViewController.getWindowOne().present(vc, animated: true, completion: nil)
//    }

}
