//
//  DXImVC.swift
//  DuixinProject
//
//  Created by Taurus on 2020/3/5.
//  Copyright © 2020 xlk. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class DXImVC: DXBaseVC {
    let dispose = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .yellow
        
        let btn = UIButton.init(type: .custom)
        btn.backgroundColor = .red
        self.view.addSubview(btn)
        btn.snp.makeConstraints { (make) in
            make.left.top.equalTo(widthScale(value: 120))
            make.width.height.equalTo(widthScale(value: 50))
        }
        btn.rx.tap
            .subscribe(onNext: {[weak self] () in
                guard let strongself = self else{return}
                let vc = DXNickNameChangeVC()
                strongself.navigationController?.pushViewController(vc, animated: true)
            })
        .disposed(by: dispose)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
