//
//  ProfileNewsCell.swift
//  VKontakteApp
//
//  Created by Дмитрий on 23.12.2020.
//

import UIKit

class ProfileNewsCell: UITableViewCell {
    
    @IBOutlet weak var profileNewsImage: UIImageView!
    @IBOutlet weak var profileNewsImageView: SetImageShadow!
    @IBOutlet weak var profileNewsName: UILabel!
    @IBOutlet weak var profileNewsTimeStamp: UILabel!
    @IBAction func avatarAnimate(_ sender: UIButton) {
        sender.animateAvatar(avatarAnimation: profileNewsImageView)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
