//
//  UIStackView+Extension.swift
//  SlotsGames
//
//  Created by Veronica Rudiuk on 28/12/2022.
//

import UIKit

// расширение для UIStackView с настройкой внешнего вида и возможностью при объявлении сразу указывать ему направление
extension UIStackView {
    convenience init ( arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat = 1, distribution: UIStackView.Distribution = .fillEqually) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
        self.distribution = distribution
    }
}
