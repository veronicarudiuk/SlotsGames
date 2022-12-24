//
//  MainVC.swift
//  SlotsGames
//
//  Created by Veronica Rudiuk on 24.12.22.
//

import UIKit
import SwiftUI

class MainVC: UIViewController {
    
    lazy var darkBackground = UIView()
    lazy var categoryPicker = UISegmentedControl(items: ["Popular", "All Games"])
    let imager = UIImage().withTintColor(.systemPink)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: K.BrandColors.bottomBG)
        
        setupDarkBackground()
        setupCategoryPicker()
        
    }
    
    //MARK: - setupDarkBackground
    private func setupDarkBackground() {
        darkBackground.backgroundColor = UIColor(named: K.BrandColors.topBG)
        darkBackground.layer.cornerRadius = 50
        
        view.addSubview(darkBackground)
        darkBackground.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    darkBackground.topAnchor.constraint(equalTo: view.topAnchor, constant: 123),
                    darkBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                    darkBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    darkBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                ])
    }
    
    private func setupCategoryPicker() {
        categoryPicker.backgroundColor = .clear
        categoryPicker.selectedSegmentIndex = 0
        categoryPicker.setupCustomSegmentControl()
        
        view.addSubview(categoryPicker)
        categoryPicker.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    categoryPicker.topAnchor.constraint(equalTo: darkBackground.topAnchor, constant: 29),
                    categoryPicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 81),
                    categoryPicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -62),
                    categoryPicker.heightAnchor.constraint(equalToConstant: 31),
                ])
    }


    
}







struct SwiftUIController: UIViewControllerRepresentable {
    typealias UIViewControllerType = MainVC
    
    func makeUIViewController(context: Context) -> UIViewControllerType {
        let viewController = UIViewControllerType()
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}

struct SwiftUIController_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIController().edgesIgnoringSafeArea(.all)
    }
}
