//
//  ProfileViewController.swift
//  VKontakteApp
//
//  Created by Дмитрий on 17.12.2020.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var image: UIImage?
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
    }
    
    @IBAction func shareAction(_ sender: Any) {
        let shareController = UIActivityViewController(activityItems: [image!], applicationActivities: nil)
        shareController.completionWithItemsHandler = { _, bool, _, _ in
        }
        present(shareController, animated: true, completion: nil)
    }
}
