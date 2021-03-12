//
//  FireBase.swift
//  VKontakteApp
//
//  Created by Дмитрий on 12.03.2021.
//

import Foundation
import FirebaseDatabase
import SwiftyJSON


class FirebaseUser {
    var id: Int
    var firstName: String
    var lastName: String
    var photo100: String
    var city: String
    var status: String
    var statusOnline: Int
    
    var ref: DatabaseReference?
    
    init(id: Int, firstName: String, lastName: String, photo100: String, city: String, status: String, statusOnline: Int ) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.photo100 = photo100
        self.city = city
        self.status = status
        self.statusOnline = statusOnline
        
        self.ref = nil
    }
    
    convenience init(_ json: JSON) {
        //self.init(json)
        let id = json["id"].intValue
        let firstName = json["first_name"].stringValue
        let lastName = json["last_name"].stringValue
        let photo100 = json["photo_200"].stringValue
        let status = json["status"].stringValue
        let statusOnline = json["online"].intValue
        let city = json["city"]["title"].stringValue
    }
    
    convenience init(id: Int, firstName: String, lastName: String, photo100: String, status: String, statusOnline: Int, city: String) {
        //self.init()
        let id = id
        let firstName = firstName
        let lastName = lastName
        let photo100 = photo100
        let status = status
        let statusOnline = statusOnline
        let city = city
        
        self.init(id: id,
                  firstName: "\(firstName)",
                  lastName: "\(lastName)",
                  photo100: "\(photo100)",
                  city: "\(city)",
                  status: "\(status)",
                  statusOnline: statusOnline)
    }
    
    init?(snapshot: DataSnapshot) {
        guard let value = snapshot.value as? [String: Any] else { return nil }
        
        guard
            let id = value["id"] as? Int,
            let firstName = value["first_name"] as? String,
            let lastName = value["last_name"] as? String,
            let photo100 = value["photo_200"] as? String,
            let status = value["status"] as? String,
            let statusOnline = value["online"] as? Int,
            let city = value["city"]["title"] as? String  else { return nil }
        
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.photo100 = photo100
        self.city = city
        self.status = status
        self.statusOnline = statusOnline
        
        self.ref = snapshot.ref
    }
    
    init?(dict: [String: Any]) {
        
        guard
            let id = dict["id"] as? Int,
            let firstName = dict["first_name"] as? String,
            let lastName = dict["last_name"] as? String,
            let photo100 = dict["photo_200"] as? String,
            let status = dict["status"] as? String,
            let statusOnline = dict["online"] as? Int,
            let city = dict["city"]["title"] as? String  else { return nil }
        
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.photo100 = photo100
        self.city = city
        self.status = status
        self.statusOnline = statusOnline
        
        self.ref = nil
    }
    
    func toAnyObject() -> [String: Any] {
        [
            "id": id,
            "firstName": firstName,
            "lastName": lastName,
            "photo100": photo100,
            "city": city,
            "status": status,
            "statusOnline": statusOnline
        ]
    }
}
