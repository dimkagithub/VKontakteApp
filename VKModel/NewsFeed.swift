//
//  NewsFeed.swift
//  VKontakteApp
//
//  Created by Дмитрий on 19.02.2021.
//

import Foundation
import RealmSwift

class NewsModel: Object, Codable {
    @objc dynamic var postID: Int = 0
    @objc dynamic var text: String = ""
    
    convenience init(postID: Int, text: String) {
        self.init()
        self.postID = postID
        self.text = text
    }
    
    enum CodingKeys: String, CodingKey {
        case postID = "post_id", text
    }
}
