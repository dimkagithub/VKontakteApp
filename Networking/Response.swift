//
//  Response.swift
//  VKontakteApp
//
//  Created by Дмитрий on 25.02.2021.
//

import Foundation

class Response<T: Codable>: Codable {
    let response: Items<T>
}

class Items<T: Codable>: Codable {
    let items: [T]
}

class ResponseJoin: Codable {
    let response: Int
}
