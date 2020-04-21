//  DXMineView.swift
//  DuixinProject
//  Created by Taurus on 2020/3/5.
//  Copyright © 2020 xlk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class DXMineView: DXBaseView {
    var userNameL: UILabel!
    var userIDL: UILabel!
    var invitecodeL: UILabel!
    let dispose = DisposeBag()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func buildMineView(adapter: DXMineAdapter){
        self.setHeaderUI(adapter: adapter)
        
        self.table.delegate = adapter
        self.table.dataSource = adapter
        self.table.backgroundColor = .white
        self.addSubview(self.table)
        
        let footerview = UIView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenW, height: widthScale(value: 100)))
        self.table.tableFooterView = footerview
        
        invitecodeL = DXUIKitFactory.createLabel(text: "我的邀请码：", font: isregularFont(size: 20), textColor: .darkGray, alignment: .center, superView: footerview)
        invitecodeL.snp.makeConstraints { (make) in
            make.top.equalTo(widthScale(value: 25))
            make.left.right.equalToSuperview()
            make.height.equalTo(widthScale(value: 15))
        }
        
        let presenter: DXMinePresenter = self.basePresent as! DXMinePresenter
        presenter.loadDataWithAdapter(adapter: adapter)
    }
    
    fileprivate func setHeaderUI(adapter: DXMineAdapter){
        let userInfo = UserInfo.mr_findFirst()
        
        let headerview = UIView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenW, height: widthScale(value: 180)))
        self.table.tableHeaderView = headerview
        
        headerview.addSubview(self.userHeaderIcon)
        self.userHeaderIcon.snp.makeConstraints { (make) in
            make.left.top.equalTo(widthScale(value: 15))
            make.width.height.equalTo(widthScale(value: 80))
        }
        self.userHeaderIcon.layer.cornerRadius = widthScale(value: 40)
        self.userHeaderIcon.layer.masksToBounds = true
        self.userHeaderIcon.isUserInteractionEnabled = true
        self.userHeaderIcon.setImageWith(URL.init(string: imageAPI + userInfo!.avatar!), placeholder: UIImage.init(named: ""))
        
        let tap = UITapGestureRecognizer.init()
        self.userHeaderIcon.addGestureRecognizer(tap)
        tap.rx.event.subscribe(onNext: {[weak self] (tap) in
            guard let strongself = self else{return}
            let vc = DXUserInfoVC()
            strongself.context?.present?.baseController?.navigationController?.pushViewController(vc, animated: true)
        })
        .disposed(by: dispose)
        
        userNameL = DXUIKitFactory.createLabel(text: (userInfo?.username)!, font: isregularFont(size: 22), textColor: .darkGray, alignment: .left, superView: headerview)
        userNameL.snp.makeConstraints { (make) in
            make.left.equalTo(self.userHeaderIcon.snp.right).offset(widthScale(value: 20))
            make.top.equalTo(self.userHeaderIcon.snp.top).offset(widthScale(value: 6))
            make.right.equalTo(widthScale(value: -15))
            make.height.equalTo(widthScale(value: 20))
        }

        let tbicon = UIImageView.init()
        headerview.addSubview(tbicon)
        tbicon.snp.makeConstraints { (make) in
            make.left.equalTo(userNameL.snp.left)
            make.top.equalTo(userNameL.snp.bottom).offset(widthScale(value: 10))
            make.height.width.equalTo(widthScale(value: 20))
        }
        tbicon.setImageWith(URL.init(string: baseUrl + userInfo!.icon_path!), placeholder: UIImage.init(named: ""))

        let id: String =  "ID:" + "\(userInfo?.userId ?? 0)"
        userIDL = DXUIKitFactory.createLabel(text: id, font: isregularFont(size: 18), textColor: .darkGray, alignment: .left, superView: headerview)
        userIDL.snp.makeConstraints { (make) in
            make.left.equalTo(tbicon.snp.right).offset(widthScale(value: 20))
            make.top.equalTo(tbicon.snp.top)
            make.right.equalTo(widthScale(value: -15))
            make.height.equalTo(tbicon.snp.height)
        }
        
        headerview.addSubview(self.collection)
        self.collection.dataSource = adapter
        self.collection.delegate = adapter
    }
    
    func reloadUIWithData(){
        self.collection.reloadData()
    }
    
    //MARK: - 控件
    lazy var table: UITableView = {
        let tableview = UITableView.init(frame: CGRect.init(x: 0, y: navigationHeight, width: kScreenW, height: kScreenH - navigationHeight - tabBarHeight), style: UITableView.Style.plain)
        tableview.clipsToBounds = false
        tableview.separatorStyle = .none
        return tableview
    }()
    
    lazy var flowLayout: UICollectionViewFlowLayout = {
        let lay = UICollectionViewFlowLayout.init()
        lay.sectionInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        lay.itemSize = CGSize(width:(kScreenW - widthScale(value: 40))/3, height:widthScale(value: 50))
        lay.scrollDirection = .horizontal
        lay.minimumInteritemSpacing = 0
        lay.minimumLineSpacing = 0
        return lay
    }()
    
    lazy var collection: UICollectionView = {
        let collectionV = UICollectionView.init(frame: CGRect.init(x: 0, y: widthScale(value: 110), width: kScreenW, height: widthScale(value: 60)), collectionViewLayout: self.flowLayout)
        collectionV.showsVerticalScrollIndicator = false
        collectionV.showsHorizontalScrollIndicator = false
        collectionV.isPagingEnabled = true
        collectionV.backgroundColor = .white
        collectionV.alwaysBounceHorizontal = true
        collectionV.alwaysBounceVertical = false
        collectionV.bounces = false
        collectionV.register(DXMineCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: MinePage.fanscellIdentifier.rawValue)
        return collectionV
    }()
    
    lazy var userHeaderIcon: UIImageView = {
        let img = UIImageView.init()
        img.backgroundColor = .red
        return img
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
