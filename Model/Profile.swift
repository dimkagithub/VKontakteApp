//
//  Profile.swift
//  VKontakteApp
//
//  Created by Дмитрий on 17.12.2020.
//

import UIKit

struct Profile {
    let profileName: String
    let profileAvatar: UIImage?
    let profileImages: [UIImage?]
}

final class ProfileClass {
    static func makeProfile() -> [Profile] {
        let disney = Profile(profileName: "Уолт Дисней", profileAvatar: UIImage(named: "p1"), profileImages: [UIImage(named: "p2"), UIImage(named: "p3"), UIImage(named: "p4"), UIImage(named: "p5"), UIImage(named: "p6"), UIImage(named: "p7"), UIImage(named: "p8"), UIImage(named: "p9"), UIImage(named: "p10")])
        return [disney]
    }
}
