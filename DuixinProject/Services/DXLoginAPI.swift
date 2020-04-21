//  DXLoginAPI.swift
//  DuixinProject
//  Created by Taurus on 2020/3/5.
//  Copyright © 2020 xlk. All rights reserved.
//

import Foundation
import Moya

public enum DXLoginAPI{
    case login(String, String)
    case smscode(String)
    case getUserInfo
    case otherRequest
}

extension DXLoginAPI: TargetType{
    public var baseURL: URL {
        return URL(string: baseUrl)!
    }
    
    public var path: String {
        switch self {
        case .login:
            return loginUrl
        case .smscode:
            return ""
        case .getUserInfo:
            return userinfoAPI
        case .otherRequest:
            return "login/otherRequest/"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .login:
            return .post
        case .otherRequest, .getUserInfo:
            return .get
        default:
            return .post
        }
    }
    
    public var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    
    public var task: Task {
        var param:[String:Any] = [:]

        switch self {
        case .login(let username,let password):
            param["tel"] = username
            param["password"] = password
        case .smscode(let username):
            param["username"] = username
        case .getUserInfo:
            break
        default:
            return .requestPlain
        }
        return .requestParameters(parameters: param, encoding: URLEncoding.default)
    }
    
    public var headers: [String : String]? {
        var header: [String: String] = ["Accept-Language":"zh-CN", "X-Requested-With":"XMLHttpRequest", "User-Agent":"Mac OS X"]
        switch self {
        case .getUserInfo:
            header["Authorization"] = (UserDefault.object(forKey: DataKey.cookie.rawValue) as! String)
        default:
            break
        }
        return header
    }
    
    
}
