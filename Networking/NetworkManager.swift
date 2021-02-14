//
//  NetworkManager.swift
//  VKontakteApp
//
//  Created by Дмитрий on 09.02.2021.
//

import Foundation
import Alamofire

class NetworkManager {
    
    private static let sessionAF: Alamofire.Session = {
        let configuration = URLSessionConfiguration.default
        configuration.allowsCellularAccess = false
        let session = Alamofire.Session(configuration: configuration)
        return session
    }()
    
    static func loadGroups(token: String) {
        
        let baseURL = "https://api.vk.com"
        let path = "/method/groups.get"
        
        let params: Parameters = [
            "access_token": token,
            "extended": 1,
            "v": "5.130"
        ]
        
        AF.request(baseURL + path, method: .get, parameters: params).responseJSON { (response) in
            guard let json = response.value else { return }
            print(json)
        }
    }
    
    static func loadFriendsPhotos(token: String) {
        
        let baseURL = "https://api.vk.com"
        let path = "/method/photos.get"
        
        let params: Parameters = [
            "access_token": token,
            "extended": 1,
            "v": "5.130",
            "album_id": "profile",
            //"owner_id": "" // где взять owner id?
        ]
        
        NetworkManager.sessionAF.request(baseURL + path, method: .get, parameters: params).responseJSON { (response) in
            guard let json = response.value else { return }
            print(json)
        }
    }
    
    static func loadFriends(token: String) {
        
        let baseURL = "https://api.vk.com"
        let path = "/method/friends.get"
        
        let params: Parameters = [
            "access_token": token,
            "extended": 1,
            "v": "5.130",
            "user_id": Session.shared.userID
        ]
        
        NetworkManager.sessionAF.request(baseURL + path, method: .get, parameters: params).responseJSON { (response) in
            guard let json = response.value else { return }
            print(json)
        }
    }
    
    static func groupSearch(token: String, query: String) {
        let baseURL = "https://api.vk.com"
        let path = "/method/groups.search"
        
        let params: Parameters = [
            "access_token": token,
            "extended": 1,
            "v": "5.130",
            "q": query
        ]
        
        NetworkManager.sessionAF.request(baseURL + path, method: .get, parameters: params).responseJSON { (response) in
            guard let json = response.value else { return }
            print(json)
        }
    }
    
}
