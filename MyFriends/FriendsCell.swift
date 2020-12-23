//
//  FriendsCell.swift
//  VKontakteApp
//
//  Created by Дмитрий on 10.12.2020.
//

import UIKit

class FriendsCell: UITableViewCell {
    
    @IBOutlet weak var friendImage: UIImageView!
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var friendStatus: UILabel!
    @IBOutlet weak var friendImageView: SetImageShadow!
    @IBAction func avatarAnimate(_ sender: UIButton) {
        sender.animateAvatar(avatarAnimation: friendImageView)
    }
}
