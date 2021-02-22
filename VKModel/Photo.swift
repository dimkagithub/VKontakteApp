//
//  Photo.swift
//  VKontakteApp
//
//  Created by Дмитрий on 19.02.2021.
//

import Foundation
import RealmSwift

class Photo: Object, Codable {
    @objc dynamic var id: Int = 0
    @objc dynamic var ownerID: Int = 0
    var sizes: [Size] = []
    
    convenience init(id: Int, ownerID: Int, sizes: [Size]) {
        self.init()
        self.id = id
        self.ownerID = ownerID
        self.sizes = sizes
    }
    
    enum CodingKeys: String, CodingKey {
        case id, ownerID = "owner_id", sizes
    }
}

class Size: Object, Codable {
    @objc dynamic var type: String? = ""
    @objc dynamic var url: String? = ""
    
    convenience init(type: String?, url: String?) {
        self.init()
        self.type = type
        self.url = url
    }
}
