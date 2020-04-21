//
//  DXMineAdapter.swift
//  DuixinProject
//
//  Created by Taurus on 2020/3/5.
//  Copyright © 2020 xlk. All rights reserved.
//

import UIKit

class DXMineAdapter: DXBaseAdapter {
    let subnames = [MinePage.fans.rawValue,MinePage.video.rawValue,MinePage.welfare.rawValue]
    let icons = [UIImage.iconWithInfo(iconText: "\u{e60c}", iconSize: 15, iconColor: .white),
                 UIImage.iconWithInfo(iconText: "\u{e7a0}", iconSize: 15, iconColor: .white),
                 UIImage.iconWithInfo(iconText: "\u{e6dc}", iconSize: 15, iconColor: .white),
                 UIImage.iconWithInfo(iconText: "\u{e6de}", iconSize: 15, iconColor: .white),
                 UIImage.iconWithInfo(iconText: "\u{e6da}", iconSize: 15, iconColor: .white)]
    let names = [MinePage.lucky.rawValue,
                 MinePage.order.rawValue,
                 MinePage.cooperation.rawValue,
                 MinePage.about.rawValue,
                 MinePage.setting.rawValue]
    
    let luckyLayer: CAGradientLayer = CAGradientLayer()
    let orderLayer: CAGradientLayer = CAGradientLayer()
    let cooperationLayer: CAGradientLayer = CAGradientLayer()
    let aboutLayer: CAGradientLayer = CAGradientLayer()
    let settingLayer: CAGradientLayer = CAGradientLayer()
    var iconColors: [CAGradientLayer] = []
    
    override init() {
        super.init()
        
        luckyLayer.colors = [RGB(h: 0xfe8f35, alpha: 1).cgColor,RGB(h: 0xf03d05, alpha: 1).cgColor]
        luckyLayer.startPoint = CGPoint.init(x: 0, y: 0)
        luckyLayer.endPoint = CGPoint.init(x: 1, y: 1)
        luckyLayer.frame = CGRect.init(x: 0, y: 0, width: widthScale(value: 30), height: widthScale(value: 30))
        iconColors.append(luckyLayer)
        
        orderLayer.colors = [RGB(h: 0xffa5b8, alpha: 1).cgColor,RGB(h: 0xff7aae, alpha: 1).cgColor]
        orderLayer.startPoint = CGPoint.init(x: 0, y: 0)
        orderLayer.endPoint = CGPoint.init(x: 1, y: 1)
        orderLayer.frame = CGRect.init(x: 0, y: 0, width: widthScale(value: 30), height: widthScale(value: 30))
        iconColors.append(orderLayer)
        
        cooperationLayer.colors = [RGB(h: 0x33d840, alpha: 1).cgColor,RGB(h: 0x54a12d, alpha: 1).cgColor]
        cooperationLayer.startPoint = CGPoint.init(x: 0, y: 0)
        cooperationLayer.endPoint = CGPoint.init(x: 1, y: 1)
        cooperationLayer.frame = CGRect.init(x: 0, y: 0, width: widthScale(value: 30), height: widthScale(value: 30))
        iconColors.append(cooperationLayer)
        
        aboutLayer.colors = [RGB(h: 0xf57bba, alpha: 1).cgColor,RGB(h: 0x8541f5, alpha: 1).cgColor]
        aboutLayer.startPoint = CGPoint.init(x: 0, y: 0)
        aboutLayer.endPoint = CGPoint.init(x: 1, y: 1)
        aboutLayer.frame = CGRect.init(x: 0, y: 0, width: widthScale(value: 30), height: widthScale(value: 30))
        iconColors.append(aboutLayer)
        
        settingLayer.colors = [RGB(h: 0x4ad8ff, alpha: 1).cgColor,RGB(h: 0x4abefc, alpha: 1).cgColor]
        settingLayer.startPoint = CGPoint.init(x: 0, y: 0)
        settingLayer.endPoint = CGPoint.init(x: 1, y: 1)
        settingLayer.frame = CGRect.init(x: 0, y: 0, width: widthScale(value: 30), height: widthScale(value: 30))
        iconColors.append(settingLayer)
    }
}

extension DXMineAdapter: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: DXMineTableViewCell? = tableView.dequeueReusableCell(withIdentifier: MinePage.minecellIdentifier.rawValue) as? DXMineTableViewCell
        if cell == nil{
            cell = DXMineTableViewCell.init(style: .default, reuseIdentifier: MinePage.minecellIdentifier.rawValue)
        }
        cell?.icon.image = icons[indexPath.row]
        cell!.nameL?.text = names[indexPath.row]
        cell?.iconbg.layer.insertSublayer(iconColors[indexPath.row], at: 0)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return widthScale(value: 60)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if let delegate = self.delegate{
            delegate.didSelectCell(type: .mineTablePop, indexpath: indexPath)
        }
    }
}

extension DXMineAdapter: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: DXMineCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: MinePage.fanscellIdentifier.rawValue, for: indexPath) as! DXMineCollectionViewCell
        
        let numStr = self.arr[indexPath.row] as! String
        cell.numL.text = numStr
        cell.subL.text = subnames[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        if let delegate = self.delegate{
            delegate.didSelectCell(type: .mineCollectionPop,indexpath: indexPath)
        }
    }
    
    
}
