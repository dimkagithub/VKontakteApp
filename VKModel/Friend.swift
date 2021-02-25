//
//  Friend.swift
//  VKontakteApp
//
//  Created by Дмитрий on 19.02.2021.
//

import Foundation
import Alamofire
import SwiftyJSON
import RealmSwift

class Friend: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var image: String = ""
    @objc dynamic var status: String = ""
    @objc dynamic var onlineStatus: Int = Int()
    var city: City?
    
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
    }
    
    convenience init(id: Int, firstName: String, lastName: String, image: String, status: String, onlineStatus: Int, city: City?) {
        self.init()
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.image = image
        self.status = status
        self.onlineStatus = onlineStatus
        self.city = city
    }
}

class City: Object {
    @objc dynamic var title: String = ""
    
    convenience init(title: String) {
        self.init()
        self.title = title
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
