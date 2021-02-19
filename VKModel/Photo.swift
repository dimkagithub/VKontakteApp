//
//  Photo.swift
//  VKontakteApp
//
//  Created by Дмитрий on 19.02.2021.
//

import Foundation

struct Photo: Codable {
    let id: Int
    let ownerID: Int
    let sizes: [Size]
    enum CodingKeys: String, CodingKey {
        case id, ownerID = "owner_id", sizes
    }
}

struct Size: Codable {
    let type: String?
    let src: String?
}
