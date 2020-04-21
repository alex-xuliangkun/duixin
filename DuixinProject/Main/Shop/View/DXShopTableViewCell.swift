//
//  DXShopTableViewCell.swift
//  DuixinProject
//
//  Created by Taurus on 2020/3/7.
//  Copyright © 2020 xlk. All rights reserved.
//

import UIKit

class DXShopTableViewCell: UITableViewCell {
    var nameL: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.backgroundColor = .yellow
        
        nameL = DXUIKitFactory.createLabel(text: "", font: isregularFont(size: 13), textColor: .darkGray, alignment: .center, superView: self.contentView)
        nameL.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.left.top.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
