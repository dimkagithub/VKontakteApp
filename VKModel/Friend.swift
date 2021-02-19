//
//  Friend.swift
//  VKontakteApp
//
//  Created by Дмитрий on 19.02.2021.
//

import Foundation

struct Friend: Codable {
    let id: Int
    let firstName: String
    let lastName: String
    let avatarURL: String
    
    enum CodingKeys: String, CodingKey {
        case id, firstName = "first_name", lastName = "last_name", avatarURL = "photo_100"
    }
    
}

struct MyVKFriendsSections {
    var title: String
    var items: [Friend]
    
}
