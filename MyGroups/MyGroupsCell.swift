//
//  MyGroupsCell.swift
//  VKontakteApp
//
//  Created by Дмитрий on 22.12.2020.
//

import UIKit

class MyGroupsCell: UITableViewCell {
    
    @IBOutlet weak var groupImage: UIImageView!
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var groupImageView: SetImageShadow!
    @IBAction func avatarAnimate(_ sender: UIButton) {
        sender.animateAvatar(avatarAnimation: groupImageView)
    }
    
    func configure(with group: Community) {
        self.groupName.text = group.groupName
        let url = URL(string: group.groupImage)
        self.groupImage.kf.setImage(with: url)
    }
}
