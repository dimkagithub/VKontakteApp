//
//  FriendsCell.swift
//  VKontakteApp
//
//  Created by Дмитрий on 10.12.2020.
//

import UIKit
import Kingfisher

class FriendsCell: UITableViewCell {
    
    @IBOutlet weak var friendImage: UIImageView!
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var friendStatus: UILabel!
    @IBOutlet weak var friendStatusView: UIImageView!
    @IBOutlet weak var friendImageView: SetImageShadow!
    @IBAction func avatarAnimate(_ sender: UIButton) {
        sender.animateAvatar(avatarAnimation: friendImageView)
    }
    
    func configure(with user: Friend) {
        self.friendName.text = "\(user.lastName) \(user.firstName)"
        let url = URL(string: user.avatarURL)
        self.friendImage.kf.setImage(with: url)
        self.friendStatus.textColor = .gray
        self.friendStatus.text = user.status
        if user.onlineStatus == 1 {
            self.friendStatusView.isHidden = false
        } else {
            self.friendStatusView.isHidden = true
        }
    }
}
