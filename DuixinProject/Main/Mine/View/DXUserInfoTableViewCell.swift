//  DXUserInfoTableViewCell.swift
//  DuixinProject
//  Created by Taurus on 2020/3/10.
//  Copyright © 2020 xlk. All rights reserved.
//  个人信息界面cell

import UIKit

class DXUserInfoTableViewCell: UITableViewCell {
    var titleL: UILabel!
    var contentL: UILabel!
    var headerIcon: UIImageView = UIImageView.init()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        
        titleL = DXUIKitFactory.createLabel(text: "", font: isregularFont(size: 15), textColor: .darkGray, alignment: .left, superView: self.contentView)
        titleL.snp.makeConstraints { (make) in
            make.left.equalTo(widthScale(value: 20))
            make.centerY.equalToSuperview()
            make.height.equalTo(widthScale(value: 20))
            make.width.equalTo(widthScale(value: 120))
        }
        
        contentL = DXUIKitFactory.createLabel(text: "", font: isregularFont(size: 15), textColor: .darkGray, alignment: .right, superView: self.contentView)
        contentL.snp.makeConstraints { (make) in
            make.right.equalTo(widthScale(value: -20))
            make.centerY.equalToSuperview()
            make.height.equalTo(widthScale(value: 20))
            make.width.equalTo(widthScale(value: 200))
        }
        
        self.contentView.addSubview(headerIcon)
        headerIcon.snp.makeConstraints { (make) in
            make.right.equalTo(widthScale(value: -20))
            make.centerY.equalToSuperview()
            make.height.width.equalTo(widthScale(value: 60))
        }
        
        DXUIKitFactory.createLine(frame: CGRect.init(x: 0, y: widthScale(value: 80) - 0.5, width: kScreenW, height: 0.5), superView: self.contentView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
