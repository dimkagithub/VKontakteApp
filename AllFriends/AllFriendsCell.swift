//
//  AllFriendsCell.swift
//  VKontakteApp
//
//  Created by Дмитрий on 26.02.2021.
//

import UIKit
import Kingfisher

class AllFriendsCell: UITableViewCell {
    
    @IBOutlet weak var friendImage: UIImageView!
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var friendCity: UILabel!
    @IBOutlet weak var friendStatusView: UIImageView!
    @IBOutlet weak var friendImageView: SetImageShadow!
    @IBAction func avatarAnimate(_ sender: UIButton) {
        sender.animateAvatar(avatarAnimation: friendImageView)
    }
    
    func configure(with user: Friend) {
        self.friendName.text = "\(user.lastName) \(user.firstName)"
        let url = URL(string: user.image)
        self.friendImage.kf.setImage(with: url)
        self.friendCity.textColor = .gray
        self.friendCity.text = ("\(user.city?.title ?? "")")
        if user.onlineStatus == 1 {
            self.friendStatusView.isHidden = false
        } else {
            self.friendStatusView.isHidden = true
        }
    }
}
