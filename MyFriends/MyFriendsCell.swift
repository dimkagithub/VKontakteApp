//
//  FriendsCell.swift
//  VKontakteApp
//
//  Created by Дмитрий on 10.12.2020.
//

import UIKit
import Kingfisher

class MyFriendsCell: UITableViewCell {
    
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
        print("")
        print("\(user.lastName) \(user.firstName)")
        print("Адрес страницы: \(user.domain)")
        print("Дата рождения: \(user.birthDay)")
        print("Место работы: \(user.occupation?.name ?? "")")
        if user.onlineStatus == 1 {
            self.friendStatusView.isHidden = false
            print("В сети")
        } else {
            self.friendStatusView.isHidden = true
            if let lastSeen = user.lastSeen?.time {
                let date = Date(timeIntervalSince1970: TimeInterval(lastSeen))
                let dateFormatter = DateFormatter()
                dateFormatter.dateStyle = DateFormatter.Style.short
                dateFormatter.timeStyle = DateFormatter.Style.short
                dateFormatter.timeZone = .current
                let userDate = dateFormatter.string(from: date)
                print("Был в сети: \(userDate)")
            }
            switch user.lastSeen?.platform {
            case 1:
                print("Мобильная версия")
            case 2:
                print("Приложение для iPhone")
            case 3:
                print("Приложение для iPad")
            case 4:
                print("Приложение для Android")
            case 5:
                print("Приложение для Windows Phone")
            case 6:
                print("Приложение для Windows 10")
            default:
                print("Полная версия сайта")
            }
        }
    }
}
