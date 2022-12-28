//
//  AnimationManager.swift
//  SlotsGames
//
//  Created by Veronica Rudiuk on 28/12/2022.
//

import UIKit

struct AnimationManager {
    
    static func buttonPressAnimation(sender: UIView) {
        UIView.animate(withDuration: 0.1,
                       animations: {
            sender.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        },
                       completion: { _ in
            UIView.animate(withDuration: 0.1) {
                sender.transform = CGAffineTransform.identity
            }
        })
    }
    
    static func textChangeAnimation(sender: UILabel, newValue: Int) {
        let animation:CATransition = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.fade
        animation.subtype = CATransitionSubtype.fromTop
        sender.text = String(newValue)
        animation.duration = 0.25
        sender.layer.add(animation, forKey: CATransitionType.fade.rawValue)
    }
}
