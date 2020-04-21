//
//  DXMineTableViewCell.swift
//  DuixinProject
//
//  Created by Taurus on 2020/3/6.
//  Copyright © 2020 xlk. All rights reserved.
//

import UIKit

class DXMineTableViewCell: UITableViewCell {
    let icon = UIImageView.init()
    var nameL: UILabel!
    var iconbg: UIView = UIView.init()

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        
        self.contentView.addSubview(iconbg)
        iconbg.snp.makeConstraints { (make) in
            make.left.equalTo(widthScale(value: 15))
            make.centerY.equalToSuperview()
            make.width.height.equalTo(widthScale(value: 30))
        }
        iconbg.layer.cornerRadius = widthScale(value: 10)
        iconbg.layer.masksToBounds = true
        
        iconbg.addSubview(icon)
        icon.snp.makeConstraints { (make) in
            make.left.equalTo(widthScale(value: 8))
            make.centerY.equalToSuperview()
            make.width.height.equalTo(widthScale(value: 14))
        }
        
        nameL = DXUIKitFactory.createLabel(text: "", font: isregularFont(size: 15), textColor: .darkGray, alignment: .left, superView: self.contentView)
        nameL.snp.makeConstraints { (make) in
            make.left.equalTo(iconbg.snp.right).offset(widthScale(value: 15))
            make.centerY.equalToSuperview()
            make.height.equalTo(widthScale(value: 15))
            make.right.equalTo(widthScale(value: -150))
        }
        
        DXUIKitFactory.createLine(frame: CGRect.init(x: 0, y: widthScale(value: 60) - 0.5, width: kScreenW, height: 0.5), superView: self.contentView)
        
        let arrowicon = UIImageView.init()
        arrowicon.image = UIImage.iconWithInfo(iconText: "\u{e609}", iconSize: 15, iconColor: tabBarColor_nor)
        self.contentView.addSubview(arrowicon)
        arrowicon.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(widthScale(value: -20))
            make.width.height.equalTo(widthScale(value: 20))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
