//
//  Group.swift
//  VKontakteApp
//
//  Created by Дмитрий on 19.02.2021.
//

import Foundation

struct Community: Codable {
    let id: Int
    let name: String
    let avatarURL: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, avatarURL = "photo_50"
    }
}
