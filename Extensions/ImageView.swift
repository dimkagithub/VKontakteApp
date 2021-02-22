//
//  ImageView.swift
//  VKontakteApp
//
//  Created by Дмитрий on 22.02.2021.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
    func getData(from url: URL, completion: @escaping (Data) -> ()) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                completion(data)
            }
        }
    }
}
