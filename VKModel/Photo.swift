//
//  Photo.swift
//  VKontakteApp
//
//  Created by Дмитрий on 19.02.2021.
//

import Foundation
import RealmSwift
import SwiftyJSON

class Photo: Object {
    @objc dynamic var id: Int = 0
    var sizes = List<PhotoSize>()
    
    convenience init(_ json: JSON) {
        self.init()
        self.id = json["id"].intValue
        let tempArray: [PhotoSize] = json["sizes"].arrayValue.compactMap{ PhotoSize($0) }
        tempArray.forEach{ (potosize) in
            self.sizes.append(potosize)
        }
    }
    
    convenience init(id: Int, sizes: [PhotoSize]) {
        self.init()
        self.id = id
        sizes.forEach{ (photosize) in
            self.sizes.append(photosize)
        }
    }
    
    override class func primaryKey() -> String? {
        "id"
    }
}

class PhotoSize: Object {
    @objc dynamic var type: String = ""
    @objc dynamic var height: Int = 0
    @objc dynamic var width: Int = 0
    @objc dynamic var urlString: String = ""
    
    convenience init(_ json: JSON) {
        self.init()
        self.type = json["type"].stringValue
        self.height = json["height"].intValue
        self.width = json["width"].intValue
        self.urlString = json["url"].stringValue
    }
    
    convenience init(type: String, height: Int, width: Int, urlString: String) {
        self.init()
        self.type = type
        self.height = height
        self.width = width
        self.urlString = urlString
    }
}
