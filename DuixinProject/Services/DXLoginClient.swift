//  DXLoginClient.swift
//  DuixinProject
//  Created by Taurus on 2020/3/5.
//  Copyright © 2020 xlk. All rights reserved.
//

import UIKit
import Moya
import RxSwift
import HandyJSON
import SwiftyJSON

class DXLoginClient: NSObject {
    static let manager = DXLoginClient()
    let dis = DisposeBag()
    let queue = DispatchQueue.init(label: "")
    
    func login(username:String, password:String, complete:@escaping ((DXLoginModel) -> Void)){
        let provide = MoyaProvider<DXLoginAPI>()
        _ = provide.rx.request(.login(username, password)).asObservable()
            .mapModelr(DXLoginModel.self)
            .subscribe(onNext: {[weak self] (model) in
                guard let strongself = self else{return}
                if model.status == ReponseCode.sucsuss.rawValue{
                    let cookie = String.init(format: "%@ %@", model.oauths.token_type,model.oauths.access_token)
                    UserDefault.set(cookie, forKey: DataKey.cookie.rawValue)
                    strongself.queue.async {
                        DispatchQueue.main.sync {
                            if let user = UserInfo.mr_findFirst(){
                                user.mr_deleteEntity()
                                NSManagedObjectContext.mr_default().mr_saveToPersistentStoreAndWait()
                            }
                            let userinfo = UserInfo.mr_createEntity()
                            userinfo?.username = model.username
                            userinfo?.avatar = model.avatar
                            
                            NSManagedObjectContext.mr_default().mr_saveToPersistentStoreAndWait()
                        }
                    }
                    
                    complete(model)
                }
                else{
                    
                }
            })
        .disposed(by: dis)
    }
    
    func getUserInfo(complete:@escaping ((DXUserInfoModel) -> Void)){
        let provide = MoyaProvider<DXLoginAPI>()
        _ = provide.rx.request(.getUserInfo).asObservable()
        .mapModelr(DXUserInfoModel.self)
            .subscribe(onNext: {[weak self] (model) in
                guard let strongself = self else{return}
                if model.status == ReponseCode.sucsuss.rawValue{
                    complete(model)
                    strongself.queue.async {
                        DispatchQueue.main.sync {
                            if let user = UserInfo.mr_findFirst(){
                                user.avatar = model.data.user.avatar
                                user.username = model.data.user.username
                                user.accept_balance_digiccy = model.data.user.accept_balance_digiccy
                                user.userId = model.data.user.id
                                user.icon_path = model.data.grade.icon_path
                                
                                user.short_video_fans_count = model.data.user.short_video_fans_count
                                user.short_video_follow_count = model.data.user.short_video_fans_count
                                user.balance_digiccy = model.data.user.balance_digiccy
                                user.accept_sign_digiccy = model.data.user.accept_sign_digiccy
                                user.broadcast_integral = model.data.user.broadcast_integral
                                
                                user.gender = model.data.user.gender
                                NSManagedObjectContext.mr_default().mr_saveToPersistentStoreAndWait()
                            }
                        }
                    }
                }
                else{
                    
                }
            })
            .disposed(by: dis)
    }
}


extension ObservableType where E == Response {
     public func mapModelr<T: HandyJSON>(_ type: T.Type) -> Observable<T> {
        return flatMap({ (response) -> Observable<T> in
            
            return Observable.just(response.mapModel(T.self))
        })
    }
}

extension Response {
    func mapModel<T: HandyJSON>(_ type: T.Type) -> T {
        // 容错,没有数据返回!
        if data.count < 1 {
            print("序列化-模型化不了")
            if let emptyValue = JSONDeserializer<T>.deserializeFrom(json: "{}"){
                return emptyValue
            } else if let emptyValue = JSONDeserializer<T>.deserializeFrom(json: "[{}]"){
                return emptyValue
            }
        }
        // 获取请求response的data转成json
        let jsonString = String.init(data: data, encoding: .utf8)
        Dprint(JSON(data).dictionaryValue)
        if let model = JSONDeserializer<T>.deserializeFrom(json: jsonString) {
            return model
        }
        return JSONDeserializer<T>.deserializeFrom(json: "{\"status\":\"请求有误\"}")!

    }
}
