//
//  UserInfo+CoreDataProperties.swift
//  DuixinProject
//
//  Created by Taurus on 2020/3/9.
//  Copyright © 2020 xlk. All rights reserved.
//
//

import Foundation
import CoreData


extension UserInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserInfo> {
        return NSFetchRequest<UserInfo>(entityName: "UserInfo")
    }

    @NSManaged public var username: String?
    @NSManaged public var avatar: String?
    @NSManaged public var userId: Int64
    @NSManaged public var icon_path: String?
    @NSManaged public var short_video_follow_count: Int64
    
    @NSManaged public var short_video_fans_count: Int64
    @NSManaged public var balance_digiccy: String?
    @NSManaged public var accept_sign_digiccy: String?
    @NSManaged public var broadcast_integral: String?
    @NSManaged public var gender: Int16
    
    @NSManaged public var accept_balance_digiccy: String?

}
