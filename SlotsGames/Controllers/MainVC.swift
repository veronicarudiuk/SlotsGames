//
//  MainVC.swift
//  SlotsGames
//
//  Created by Veronica Rudiuk on 24.12.22.
//

import UIKit
import SwiftUI

class MainVC: UIViewController {
    
    lazy var profileIcon = UIImageView()
    lazy var chestIcon = UIImageView()
    lazy var moneyLabel = UILabel()
    lazy var darkBackground = UIView()
    lazy var popularButton = UIButton()
    lazy var allGamesButton = UIButton()
    lazy var redUnderlinePopular = UIImageView()
    lazy var redUnderlineAll = UIImageView()
    lazy var slotsGameOneButton = UIButton()
    lazy var slotsGameTwoButton = UIButton()
    lazy var slotsGameThreeButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: K.BrandColors.bottomBG)
        
        setupDarkBackground()
        setupProfileIcon()
        setupMoneySection()
        setupButtons()
        setupSlotsGameButtons()
    }
    
    //MARK: - setupDarkBackground
    private func setupDarkBackground() {
        darkBackground.backgroundColor = UIColor(named: K.BrandColors.topBG)
        darkBackground.layer.cornerRadius = 50
        darkBackground.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        view.addSubview(darkBackground)
        darkBackground.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            darkBackground.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            darkBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            darkBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            darkBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    func setupProfileIcon() {
        view.addSubview(profileIcon)
        profileIcon.image = UIImage(named: "ProfileIcon")
        profileIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileIcon.bottomAnchor.constraint(equalTo: darkBackground.topAnchor, constant: -32),
            profileIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 34),
        ])
    }
    
    func setupMoneySection() {
        view.addSubview(moneyLabel)
        view.addSubview(chestIcon)
        moneyLabel.translatesAutoresizingMaskIntoConstraints = false
        chestIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            moneyLabel.bottomAnchor.constraint(equalTo: darkBackground.topAnchor, constant: -42),
            moneyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -34),
            moneyLabel.widthAnchor.constraint(equalToConstant: 124),
            moneyLabel.heightAnchor.constraint(equalToConstant: 26),
            
            chestIcon.bottomAnchor.constraint(equalTo: darkBackground.topAnchor, constant: -32),
            chestIcon.trailingAnchor.constraint(equalTo: moneyLabel.trailingAnchor, constant: -103),
            chestIcon.heightAnchor.constraint(equalToConstant: 45),
            chestIcon.widthAnchor.constraint(equalToConstant: 53.62)
        ])
        
        moneyLabel.text = "123 456"
        moneyLabel.textAlignment = .center
        moneyLabel.font = UIFont(name: K.Fonts.robotoBold, size: 18)
        moneyLabel.textColor = .white
        moneyLabel.backgroundColor = .tintColor
        moneyLabel.layer.masksToBounds = true
        moneyLabel.layer.cornerRadius = 3
        
        chestIcon.image = UIImage(named: "ChestIcon")
        
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
        popularButton.isSelected = true
        buttonsApperance()
        
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
        slotsGameTwoButton.isHidden = !slotsGameTwoButton.isHidden
        slotsGameThreeButton.isHidden = !slotsGameThreeButton.isHidden
        buttonsApperance()
    }
    
    private func setupButtonImages(image: UIImageView, connectedButton: UIButton) {
        view.addSubview(image)
        image.image = UIImage(named: "RedUnderline")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.topAnchor.constraint(equalTo: connectedButton.bottomAnchor, constant: 3).isActive = true
        image.centerXAnchor.constraint(equalTo: connectedButton.centerXAnchor).isActive = true
    }
    
    private func setupSlotsGameButtons() {
        for button in [slotsGameOneButton, slotsGameTwoButton, slotsGameThreeButton] {
            view.addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
        }
        
        slotsGameOneButton.setImage(UIImage(named: "GamePic1"), for: .normal)
        slotsGameTwoButton.setImage(UIImage(named: "GamePic2"), for: .normal)
        slotsGameThreeButton.setImage(UIImage(named: "GamePic3"), for: .normal)
        
        slotsGameOneButton.addTarget(target, action: #selector(openGameAction(_:)), for: .touchUpInside)
        slotsGameTwoButton.addTarget(target, action: #selector(openGameAction(_:)), for: .touchUpInside)
        slotsGameThreeButton.addTarget(target, action: #selector(openGameAction(_:)), for: .touchUpInside)
        
        slotsGameTwoButton.isHidden = true
        slotsGameThreeButton.isHidden = true
        
        NSLayoutConstraint.activate([
            slotsGameOneButton.topAnchor.constraint(equalTo: popularButton.bottomAnchor, constant: 42),
            slotsGameOneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            slotsGameOneButton.widthAnchor.constraint(equalToConstant: 346),
            slotsGameOneButton.heightAnchor.constraint(equalToConstant: 165),
            
            slotsGameTwoButton.topAnchor.constraint(equalTo: slotsGameOneButton.bottomAnchor, constant: 20),
            slotsGameTwoButton.leadingAnchor.constraint(equalTo: slotsGameOneButton.leadingAnchor),
            slotsGameTwoButton.widthAnchor.constraint(equalToConstant: 165),
            slotsGameTwoButton.heightAnchor.constraint(equalToConstant: 165),
            
            slotsGameThreeButton.topAnchor.constraint(equalTo: slotsGameOneButton.bottomAnchor, constant: 20),
            slotsGameThreeButton.trailingAnchor.constraint(equalTo: slotsGameOneButton.trailingAnchor),
            slotsGameThreeButton.widthAnchor.constraint(equalToConstant: 165),
            slotsGameThreeButton.heightAnchor.constraint(equalToConstant: 165),
            
        ])
    }
    
    @objc private func openGameAction(_ sender: UIButton) {
           let gameVC = GameVC()
           navigationController?.pushViewController(gameVC, animated: true)
        
//        navigationController?.popToRootViewController(animated: true)
       }
    
    //    фиксирую этот экран в портретном режиме
        override func viewWillAppear(_ animated: Bool) {
            AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
        }
        
        //    после закрытия этого экрана разрешаю другим экранам менять ориентацию в зависимости от положения девайса
        override func viewWillDisappear(_ animated: Bool) {
            AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.all)
        }
}







//struct SwiftUIController: UIViewControllerRepresentable {
//    typealias UIViewControllerType = MainVC
//    
//    func makeUIViewController(context: Context) -> UIViewControllerType {
//        let viewController = UIViewControllerType()
//        return viewController
//    }
//    
//    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
//    }
//}
//
//struct SwiftUIController_Previews: PreviewProvider {
//    static var previews: some View {
//        SwiftUIController().edgesIgnoringSafeArea(.all)
//    }
//}
