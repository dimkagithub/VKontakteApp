//
//  VKLoginFormController.swift
//  VKontakteApp
//
//  Created by Дмитрий on 13.02.2021.
//

import UIKit
import WebKit

class VKLoginFormController: UIViewController {
    
    let netConstants = NetworkConstants()
    
    @IBOutlet weak var webView: WKWebView! {
        didSet {
            webView.navigationDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: netConstants.clientID),
            URLQueryItem(name: "display", value: netConstants.display),
            URLQueryItem(name: "redirect_uri", value: netConstants.redirectURI),
            URLQueryItem(name: "scope", value: netConstants.scope),
            URLQueryItem(name: "response_type", value: netConstants.responseType),
            URLQueryItem(name: "v", value: netConstants.APIversion)
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        
        webView.load(request)
    }
}

extension VKLoginFormController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url,
              url.path == "/blank.html",
              let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                
                return dict
            }
        print(params)
        
        guard let token = params["access_token"],
              let userIdString = params["user_id"],
              let _ = Int(userIdString) else {
            decisionHandler(.allow)
            return
        }
        
        Session.shared.token = token
        decisionHandler(.cancel)
        performSegue(withIdentifier: "TabBarSegue", sender: nil)
    }
}
