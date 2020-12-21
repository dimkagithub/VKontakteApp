//
//  NewsCell.swift
//  VKontakteApp
//
//  Created by Дмитрий on 19.12.2020.
//

import UIKit

class NewsCell: UITableViewCell {
    @IBOutlet weak var newsProfileAvatar: UIImageView!
    @IBOutlet weak var newsProfileName: UILabel!
    @IBOutlet weak var newsProfileDateStamp: UILabel!
    @IBOutlet weak var newsProfileText: UILabel!
    @IBOutlet weak var newsProfileImage: UIImageView!
    @IBOutlet weak var newsProfileLikeCounter: UILabel!
    @IBOutlet weak var newsProfileLikeButton: UIButton!
    @IBOutlet weak var newsProfileViewsCounter: UILabel!
    @IBOutlet weak var newsProfileViewsSign: UIButton!
    @IBAction func pulseButton(_ sender: UIButton) {
        sender.pulsate()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        layer.borderColor = UIColor.lightGray.cgColor
//        layer.borderWidth = 0.5
//        layer.cornerRadius = 10
        newsProfileLikeButton.setImage(#imageLiteral(resourceName: "redlike"), for: .selected)
        newsProfileLikeButton.setImage(#imageLiteral(resourceName: "bluelike"), for: .normal)
        newsProfileLikeCounter.textColor = newsProfileLikeButton.isSelected ? .red : .systemBlue
        newsProfileLikeCounter.text = "0"
    }
    
    @IBAction func like() {
        newsProfileLikeButton.isSelected.toggle()
        newsProfileLikeCounter.textColor = newsProfileLikeButton.isSelected ? .red : .systemBlue
        newsProfileLikeCounter.text = newsProfileLikeButton.isSelected ? "1" : "0"
    }
}
