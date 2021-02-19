//
//  NewsFeed.swift
//  VKontakteApp
//
//  Created by Дмитрий on 19.02.2021.
//

import Foundation

struct NewsModel: Codable {
    let postID: Int
    let text: String
    
    
    
    enum CodingKeys: String, CodingKey {
        case postID = "post_id", text
    }
}
