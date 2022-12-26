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
    lazy var popularButton = UIButton()
    lazy var allGamesButton = UIButton()
    lazy var redUnderlinePopular = UIImageView()
    lazy var redUnderlineAll = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: K.BrandColors.bottomBG)
        
        setupDarkBackground()
        setupButtons()
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
    
    //MARK: - setupButtons and setupButtonImages
    private func setupButtons() {
        view.addSubview(popularButton)
        view.addSubview(allGamesButton)
        view.addSubview(redUnderlinePopular)
        view.addSubview(redUnderlineAll)
        
        let controlStates: Array<UIControl.State> = [.normal, .selected]
        for controlState in controlStates {
            popularButton.setTitle(NSLocalizedString("Popular", comment: ""), for: controlState)
            allGamesButton.setTitle(NSLocalizedString("All Games", comment: ""), for: controlState)
        }
        buttonsApperance()
        popularButton.isSelected = true
        
        popularButton.addTarget(target, action: #selector(keyPressed(_:)), for: .touchUpInside)
        allGamesButton.addTarget(target, action: #selector(keyPressed(_:)), for: .touchUpInside)
        
        popularButton.translatesAutoresizingMaskIntoConstraints = false
        allGamesButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            popularButton.topAnchor.constraint(equalTo: darkBackground.topAnchor, constant: 29),
            popularButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 81),
            allGamesButton.topAnchor.constraint(equalTo: darkBackground.topAnchor, constant: 29),
            allGamesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -62)
        ])
        
        setupButtonImages(image: redUnderlinePopular, connectedButton: popularButton)
        setupButtonImages(image: redUnderlineAll, connectedButton: allGamesButton)
        redUnderlineAll.isHidden = true
    }
    
    private func buttonsApperance() {
        for button in [popularButton, allGamesButton] {
            switch button.isSelected {
            case true:
                button.titleLabel?.font = UIFont(name: K.Fonts.sfProDisplayBold, size: 20)
                button.titleLabel?.textColor = .white
            case false:
                button.titleLabel?.font = UIFont(name: K.Fonts.sfProDisplayRegular, size: 20)
                button.titleLabel?.textColor = UIColor(named: K.BrandColors.lightGrayText)
            }
        }
    }
    
    @objc private func keyPressed(_ sender: UIButton) {
        popularButton.isSelected = !popularButton.isSelected
        redUnderlinePopular.isHidden = !redUnderlinePopular.isHidden
        allGamesButton.isSelected = !allGamesButton.isSelected
        redUnderlineAll.isHidden = !redUnderlineAll.isHidden
        buttonsApperance()
    }
    
    private func setupButtonImages(image: UIImageView, connectedButton: UIButton) {
        view.addSubview(image)
        image.image = UIImage(named: "RedUnderline")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.topAnchor.constraint(equalTo: connectedButton.bottomAnchor, constant: 3).isActive = true
        image.centerXAnchor.constraint(equalTo: connectedButton.centerXAnchor).isActive = true
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
