//
//  AvatarAnimate.swift
//  VKontakteApp
//
//  Created by Дмитрий on 22.12.2020.
//

import UIKit

extension UIButton {
    func animateAvatar(avatarAnimation: UIImageView) {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0.7
        animation.toValue = 1.0
        animation.stiffness = 350.0
        animation.duration = 0.7
        avatarAnimation.layer.add(animation, forKey: nil)
    }
}
