//
//  UIView+Extension.swift
//  SlotsGames
//
//  Created by Veronica Rudiuk on 28/12/2022.
//

import UIKit

extension UIView {
    func setUpEdgeToEdge(in container: UIView, insets: UIEdgeInsets = .zero) {
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: container.topAnchor, constant: insets.top),
            self.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: insets.left),
            self.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: insets.bottom),
            self.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -insets.right),
        ])
    }
}

