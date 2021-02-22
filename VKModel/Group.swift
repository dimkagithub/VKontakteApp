//
//  Group.swift
//  VKontakteApp
//
//  Created by Дмитрий on 19.02.2021.
//

import Foundation
import RealmSwift

class Community: Object, Codable {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var avatarURL: String = ""
    
    convenience init(id: Int, name: String, avatarURL: String) {
        self.init()
        self.id = id
        self.name = name
        self.avatarURL = avatarURL
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name, avatarURL = "photo_50"
    }
}

class AllGroupsSection: Object {
    @objc dynamic var title: String = ""
    var items: [Community] = []
    
    convenience init(title: String, items: [Community]) {
        self.init()
        self.title = title
        self.items = items
    }
}
