//
//  NetworkManager.swift
//  VKontakteApp
//
//  Created by Дмитрий on 09.02.2021.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkManager {
    
    private static let baseURL = "https://api.vk.com"
    private static let version = "5.130"
    
    func getPhoto(for userId: Int, completion: @escaping ([Photo]) -> Void) {
        let path = "/method/photos.getAll"
        
        let params: Parameters = [
            "access_token": Session.shared.token,
            "v": NetworkManager.version,
            "extended": 1,
            "owner_id": "\(userId)"
        ]
        
        AF.request(NetworkManager.baseURL + path,
                   method: .get,
                   parameters: params)
            .response { response in
                switch response.result {
                case .success(let data):
                    guard
                        let data = data else { return }
                    let json = JSON(data)
                    let photoJSONs = json["response"]["items"].arrayValue
                    let photos = photoJSONs.compactMap { Photo($0) }
                    completion(photos)
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    func getCommunity(completion: @escaping ([Community]) -> Void) {
        let path = "/method/groups.get"
        
        let params: Parameters = [
            "access_token": Session.shared.token,
            "v": NetworkManager.version,
            "extended": 1
        ]
        
        AF.request(NetworkManager.baseURL + path,
                   method: .get,
                   parameters: params)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    let json = JSON(data)
                    let groupJSONs = json["response"]["items"].arrayValue
                    let groups = groupJSONs.compactMap { Community($0) }
                    completion(groups)
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    func getFriends(completion: @escaping ([Friend]) -> Void) {
        let path = "/method/friends.get"
        
        let params: Parameters = [
            "access_token": Session.shared.token,
            "v": NetworkManager.version,
            "fields": "photo_200, online, status, city, last_seen, bdate"
        ]
        
        AF.request(NetworkManager.baseURL + path,
                   method: .get,
                   parameters: params)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    let json = JSON(data)
                    let friendsJSONList = json["response"]["items"].arrayValue
                    let friends = friendsJSONList.compactMap { Friend($0) }
                    completion(friends)
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    func searchCommunity(token: String, group name: String, completion: @escaping ([Community]) -> Void) {
        let path = "/method/groups.search"
        
        let params: Parameters = [
            "access_token": Session.shared.token,
            "q": name,
            "v": NetworkManager.version
        ]
        AF.request(NetworkManager.baseURL + path, method: .get, parameters: params).responseData { response in
            switch response.result {
            case.success(let data):
                let json = JSON(data)
                let community = json["response"]["items"].arrayValue
                let allCommunity = community.compactMap{ Community($0) }
                completion(allCommunity)
            case.failure(let error):
                print(error)
            }
        }
    }
}
