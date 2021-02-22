////
////  Authorize.swift
////  VKontakteApp
////
////  Created by Дмитрий on 13.02.2021.
////
//
//import Foundation
//
//class  Authorize {
//
//    let netConstants = NetworkConstants()
//
//    func  getRequest() -> URLRequest? {
//        var components = URLComponents()
//        components.scheme = "https"
//        components.host = "oauth.vk.com"
//        components.path = "/authorize"
//        components.queryItems = [
//            URLQueryItem(name: "client_id", value: netConstants.clientID),
//            URLQueryItem(name: "scope", value: netConstants.scope),
//            URLQueryItem(name: "display", value: netConstants.display),
//            URLQueryItem(name: "redirect_uri", value: netConstants.redirectURI),
//            URLQueryItem(name: "response_type", value: netConstants.responseType),
//            URLQueryItem(name: "v", value: netConstants.APIversion)
//        ]
//
//        guard let url = components.url else { return nil }
//        let request = URLRequest(url: url)
//        return request
//    }
//}
