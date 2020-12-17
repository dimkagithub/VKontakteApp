//
//  ProfileCell.swift
//  VKontakteApp
//
//  Created by Дмитрий on 17.12.2020.
//

import UIKit

class ProfileCell: UICollectionViewCell {
    
    @IBAction func pulseButton(_ sender: UIButton) {
        sender.pulsate()
    }
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeCounter: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        layer.borderColor = UIColor.lightGray.cgColor
//        layer.borderWidth = 0.5
//        layer.cornerRadius = 10
        likeButton.setImage(#imageLiteral(resourceName: "redlike"), for: .selected)
        likeButton.setImage(#imageLiteral(resourceName: "bluelike"), for: .normal)
        likeCounter.textColor = likeButton.isSelected ? .red : .systemBlue
        likeCounter.text = "0"
    }
    
    @IBAction func like() {
        likeButton.isSelected.toggle()
        likeCounter.textColor = likeButton.isSelected ? .red : .systemBlue
        likeCounter.text = likeButton.isSelected ? "1" : "0"
    }
}
