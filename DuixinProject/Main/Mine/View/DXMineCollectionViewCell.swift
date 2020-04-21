//
//  DXMineCollectionViewCell.swift
//  DuixinProject
//
//  Created by Taurus on 2020/3/6.
//  Copyright © 2020 xlk. All rights reserved.
//

import UIKit

class DXMineCollectionViewCell: UICollectionViewCell {
    var numL: UILabel!
    var subL: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        numL = DXUIKitFactory.createLabel(text: "0", font: isregularFont(size: 15), textColor: .darkGray, alignment: .center, superView: self.contentView)
        numL.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalTo(widthScale(value: 15))
            make.top.equalTo(widthScale(value: 6))
        }
        
        subL = DXUIKitFactory.createLabel(text: "", font: isregularFont(size: 12), textColor: .darkGray, alignment: .center, superView: self.contentView)
        subL.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalTo(widthScale(value: 15))
            make.top.equalTo(widthScale(value: 25))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
