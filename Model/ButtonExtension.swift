//
//  ButtonExtension.swift
//  VKontakteApp
//
//  Created by Дмитрий on 13.12.2020.
//

import UIKit

extension UIButton {
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.3
        pulse.fromValue = 0.7
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 1.0
        pulse.initialVelocity = 0.9
        pulse.damping = 1.0
        layer.add(pulse, forKey: nil)
    }
}
