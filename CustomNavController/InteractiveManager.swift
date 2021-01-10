//
//  InteractiveManager.swift
//  VKontakteApp
//
//  Created by Дмитрий on 08.01.2021.
//

import UIKit

class InteractiveManager: UIPercentDrivenInteractiveTransition {
    var hasStarted = false
    var shouldFinish = false
    var viewController: UIViewController! {
        didSet {
            let gesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handleGesture(_:)))
            gesture.edges = .left
            viewController?.view.addGestureRecognizer(gesture)
        }
    }
    
    @objc func handleGesture(_ gestureRecognizer: UIScreenEdgePanGestureRecognizer) {
    
        switch gestureRecognizer.state {
        case .began:
            hasStarted = true
            viewController.navigationController?.popViewController(animated: true)
        case .changed:
            let translation = gestureRecognizer.translation(in: gestureRecognizer.view)
            let relativeTranslation = abs(translation.x) / 50
            let progress = max(0, min(1, relativeTranslation))
            shouldFinish = progress > 0.35
            update(progress)
        case .cancelled:
            hasStarted = false
            cancel()
        case .ended:
            hasStarted = false
            shouldFinish ? finish() : cancel()
        default:
            break
        }
    }
    
}
