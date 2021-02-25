//
//  Group.swift
//  VKontakteApp
//
//  Created by Дмитрий on 19.02.2021.
//

import Foundation
import RealmSwift
import SwiftyJSON

class Community: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var groupName: String = ""
    @objc dynamic var groupImage: String = ""
    
    convenience init(_ json: JSON) {
        self.init()
        self.id = json["id"].intValue
        self.groupName = json["name"].stringValue
        self.groupImage = json["photo_200"].stringValue
    }
    
    convenience init(id: Int, groupName: String, groupImage: String) {
        self.init()
        self.id = id
        self.groupName = groupName
        self.groupImage = groupImage
    }
}

class GroupsSection: Object {
    @objc dynamic var title: String = ""
    var items: [Community] = []
    
    convenience init(title: String, items: [Community]) {
        self.init()
        self.title = title
        self.items = items
    }
}

struct CommunityResponse<T: Decodable>: Decodable {
    var response: Response
    
    struct Response: Decodable {
        let count: Int?
        var items: [T]
    }
}
