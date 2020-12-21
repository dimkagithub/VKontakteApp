//
//  Users.swift
//  VKontakteApp
//
//  Created by Дмитрий on 11.12.2020.
//

import UIKit

enum UserStatus: String, CaseIterable {
    case online = "В сети"
    case offline = "Не в сети"
    static func setRandomStatus() -> UserStatus {
        return UserStatus.allCases[Int.random(in: 0...1)]
    }
}

struct MyFriendsSections {
    var title: String
    var items: [Users]
    
}

struct Users {
    let userName: String
    let userAvatar: UIImage?
    let userImages: [UIImage?]
}

final class Friends {
    static func makeFriends() -> [Users] {
        let dale = Users(userName: "Дейл", userAvatar: UIImage(named: "u1"), userImages: [UIImage(named: "u1"), UIImage(named: "u1-1"), UIImage(named: "u2-1"), UIImage(named: "u3-1"), UIImage(named: "u4-1")])
        let tom = Users(userName: "Том", userAvatar: UIImage(named: "u2"), userImages: [UIImage(named: "u2"), UIImage(named: "u1-2"), UIImage(named: "u2-2"), UIImage(named: "u3-2"), UIImage(named: "u4-2")])
        let jerry = Users(userName: "Джерри", userAvatar: UIImage(named: "u3"), userImages: [UIImage(named: "u3"), UIImage(named: "u1-3"), UIImage(named: "u2-3"), UIImage(named: "u3-3"), UIImage(named: "u4-3")])
        let chip = Users(userName: "Чип", userAvatar: UIImage(named: "u4"), userImages: [UIImage(named: "u4"), UIImage(named: "u1-4"), UIImage(named: "u2-4"), UIImage(named: "u3-4"), UIImage(named: "u4-4")])
        let bunny = Users(userName: "Заяц", userAvatar: UIImage(named: "u5"), userImages: [UIImage(named: "u5"), UIImage(named: "u1-5"), UIImage(named: "u2-5"), UIImage(named: "u3-5"), UIImage(named: "u4-5")])
        let wolf = Users(userName: "Волчара", userAvatar: UIImage(named: "u6"), userImages: [UIImage(named: "u6"), UIImage(named: "u1-6"), UIImage(named: "u2-6"), UIImage(named: "u3-6"), UIImage(named: "u4-6")])
        let pup = Users(userName: "Волк", userAvatar: UIImage(named: "u7"), userImages: [UIImage(named: "u7"), UIImage(named: "u1-7"), UIImage(named: "u2-7"), UIImage(named: "u3-7"), UIImage(named: "u4-7")])
        let leupold = Users(userName: "Леопольд", userAvatar: UIImage(named: "u8"), userImages: [UIImage(named: "u8"), UIImage(named: "u1-8"), UIImage(named: "u2-8"), UIImage(named: "u3-8"), UIImage(named: "u4-8")])
        let walle = Users(userName: "Валл-И", userAvatar: UIImage(named: "u9"), userImages: [UIImage(named: "u9"), UIImage(named: "u1-9"), UIImage(named: "u2-9"), UIImage(named: "u3-9"), UIImage(named: "u4-9")])
        let hackwrench = Users(userName: "Гайка", userAvatar: UIImage(named: "u10"), userImages: [UIImage(named: "u10"), UIImage(named: "u1-10"), UIImage(named: "u2-10"), UIImage(named: "u3-10"), UIImage(named: "u4-10")])
        return [dale, tom, jerry, chip, bunny, wolf, pup, leupold, walle, hackwrench]
    }
}
