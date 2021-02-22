//
//  Session.swift
//  VKontakteApp
//
//  Created by Дмитрий on 13.02.2021.
//

import Foundation

class Session {
    static let shared = Session()
    var token = ""
    var userID = Int()
    
    private init() {
    }
}
