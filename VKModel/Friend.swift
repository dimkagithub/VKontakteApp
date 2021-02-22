//
//  Friend.swift
//  VKontakteApp
//
//  Created by Дмитрий on 19.02.2021.
//

import Foundation
import RealmSwift

class Friend: Object, Codable {
    @objc dynamic var id: Int = 0
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var avatarURL: String = ""
    @objc dynamic var status: String = ""
    @objc dynamic var onlineStatus: Int = 0
    
    convenience init(id: Int, firstName: String, lastName: String, avatarURL: String, status: String, onlineStatus: Int) {
        self.init()
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.avatarURL = avatarURL
        self.status = status
        self.onlineStatus = onlineStatus
    }
    
    enum CodingKeys: String, CodingKey {
        case id, firstName = "first_name", lastName = "last_name", avatarURL = "photo_100", onlineStatus = "online", status = "status"
    }
}

class MyVKFriendsSections: Object {
    @objc dynamic var title: String = ""
    var items: [Friend] = []
    
    convenience init(title: String, items: [Friend]) {
        self.init()
        self.title = title
        self.items = items
    }
}
