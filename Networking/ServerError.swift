//
//  ServerError.swift
//  VKontakteApp
//
//  Created by Дмитрий on 19.02.2021.
//

import Foundation

enum ServerError: Error {
    case noDataProvided
    case failedToDecode
    case errorTask
}
