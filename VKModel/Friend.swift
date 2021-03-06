//
//  Friend.swift
//  VKontakteApp
//
//  Created by Дмитрий on 19.02.2021.
//

import Foundation
import RealmSwift
import SwiftyJSON

class Friend: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var image: String = ""
    @objc dynamic var status: String = ""
    @objc dynamic var onlineStatus: Int = Int()
    var city: City?
    var lastSeen: LastSeen?
    @objc dynamic var birthDay: String = ""
    @objc dynamic var domain: String = ""
    var occupation: Occupation?
    
    convenience init(_ json: JSON) {
        self.init()
        self.id = json["id"].intValue
        self.firstName = json["first_name"].stringValue
        self.lastName = json["last_name"].stringValue
        self.image = json["photo_200"].stringValue
        self.status = json["status"].stringValue
        self.onlineStatus = json["online"].intValue
        let cityTitle = json["city"]["title"].stringValue
        self.city = City(title: cityTitle)
        let seenTime = json["last_seen"]["time"].intValue
        let seenPlatform = json["last_seen"]["platform"].intValue
        self.lastSeen = LastSeen(time: seenTime, platform: seenPlatform)
        self.birthDay = json["bdate"].stringValue
        self.domain = json["domain"].stringValue
        let occupationType = json["occupation"]["type"].stringValue
        let occupationID = json["occupation"]["id"].intValue
        let occupationName = json["occupation"]["name"].stringValue
        self.occupation = Occupation(type: occupationType, id: occupationID, name: occupationName)
    }
    
    convenience init(id: Int, firstName: String, lastName: String, image: String, status: String, onlineStatus: Int, city: City?, lastSeen: LastSeen?, birthDay: String, domain: String, occupation: Occupation?) {
        self.init()
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.image = image
        self.status = status
        self.onlineStatus = onlineStatus
        self.city = city
        self.lastSeen = lastSeen
        self.birthDay = birthDay
        self.domain = domain
        self.occupation = occupation
    }
    
    override class func primaryKey() -> String? {
        "id"
    }
}

class City: Object {
    @objc dynamic var title: String = ""
    
    convenience init(title: String) {
        self.init()
        self.title = title
    }
}

class LastSeen: Object {
    @objc dynamic var time: Int = 0
    @objc dynamic var platform: Int = 0
    
    convenience init(time: Int, platform: Int) {
        self.init()
        self.time = time
        self.platform = platform
    }
}

class Occupation: Object {
    @objc dynamic var type: String = ""
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    
    convenience init(type: String, id: Int, name: String) {
        self.init()
        self.type = type
        self.id = id
        self.name = name
    }
}

class FriendsSections: Object {
    @objc dynamic var title: String = ""
    var items: [Friend] = []
    
    convenience init(title: String, items: [Friend]) {
        self.init()
        self.title = title
        self.items = items
    }
}
