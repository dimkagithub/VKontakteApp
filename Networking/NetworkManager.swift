//
//  NetworkManager.swift
//  VKontakteApp
//
//  Created by Дмитрий on 09.02.2021.
//

import Foundation

class Session {
    static var shared = Session()
    var token: String?
    var userID: Int?
    
    private init() {
    }
}
