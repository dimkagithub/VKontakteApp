//
//  RealmManager.swift
//  VKontakteApp
//
//  Created by Дмитрий on 03.03.2021.
//

import Foundation
import RealmSwift

class RealmManager {
    static let deleteMigration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
    static func save<T: Object>(items: [T],
                                configuratuon: Realm.Configuration = deleteMigration,
                                update: Realm.UpdatePolicy = .modified) throws {
        let realm = try Realm(configuration: configuratuon)
        print(configuratuon.fileURL ?? "")
        try realm.write {
            realm.add(items, update: update)
        }
    }
}
