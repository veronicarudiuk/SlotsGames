//
//  GameVC.swift
//  SlotsGames
//
//  Created by Veronica Rudiuk on 24.12.22.
//

import UIKit
import SwiftUI

class GameVC: UIViewController {
    
    lazy var mainBackground = UIImageView()
    lazy var spinBackground = UIImageView()
    lazy var homeButton = UIButton()
    lazy var chestIcon = UIImageView()
    lazy var moneyLabel = UILabel()
    lazy var spinIcon = UIButton()
    lazy var customStepper = CustomStepper()
    lazy var infoTitle = UILabel()
    lazy var slotsPicker = UIPickerView()
    
    var viewModel = GameViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgrounds()
        setupHomeButton()
        setupMoneySection()
        setupSpinIcon()
        setupStepper()
        setupInfoTitle()
        setupSlotsPicker()
        navigationController?.isNavigationBarHidden = true
    }
    
    //MARK: - setupBackgrounds
    private func setupBackgrounds() {
        mainBackground.image = UIImage(named: "Background")
        spinBackground.image = UIImage(named: "SpinBackground")
        
        view.addSubview(mainBackground)
        view.addSubview(spinBackground)
        
        mainBackground.translatesAutoresizingMaskIntoConstraints = false
        spinBackground.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainBackground.topAnchor.constraint(equalTo: view.topAnchor),
            mainBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            spinBackground.topAnchor.constraint(equalTo: view.topAnchor),
            spinBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            spinBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    //MARK: - setupHomeButton
    private func setupHomeButton() {
        homeButton.setImage(UIImage(named: "HomeIcon"), for: .normal)
        homeButton.addTarget(target, action: #selector(homeButtonAction(_:)), for: .touchUpInside)
        
        view.addSubview(homeButton)
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            homeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 25),
            homeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            homeButton.heightAnchor.constraint(equalToConstant: 25),
            homeButton.widthAnchor.constraint(equalToConstant: 26)
        ])
    }
    
    @objc private func homeButtonAction(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
       }
    
    //MARK: - setupMoneySection
    private func setupMoneySection() {
        view.addSubview(chestIcon)
        view.addSubview(moneyLabel)
        chestIcon.translatesAutoresizingMaskIntoConstraints = false
        moneyLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chestIcon.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            chestIcon.leadingAnchor.constraint(equalTo: moneyLabel.leadingAnchor, constant: 28),
            chestIcon.widthAnchor.constraint(equalToConstant: 115),
            chestIcon.heightAnchor.constraint(equalToConstant: 97),
            
            moneyLabel.topAnchor.constraint(equalTo: chestIcon.topAnchor, constant: 72),
            moneyLabel.leadingAnchor.constraint(equalTo: spinBackground.leadingAnchor, constant: 21),
            moneyLabel.heightAnchor.constraint(equalToConstant: 30),
            moneyLabel.widthAnchor.constraint(equalToConstant: 170),
        ])
        
        moneyLabel.text = "123 456"
        moneyLabel.textAlignment = .center
        moneyLabel.font = UIFont(name: K.Fonts.robotoBold, size: 22)
        moneyLabel.textColor = .tintColor
        moneyLabel.backgroundColor = UIColor(patternImage: UIImage(named: "AmountBGOrange")!)
        moneyLabel.layer.masksToBounds = true
        moneyLabel.layer.cornerRadius = 3
        
        chestIcon.image = UIImage(named: "ChestIcon")
    }
    
    //MARK: - setupSpinIcon
    private func setupSpinIcon() {
        view.addSubview(spinIcon)
        spinIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            spinIcon.widthAnchor.constraint(equalToConstant: 150),
            spinIcon.heightAnchor.constraint(equalToConstant: 150),
            spinIcon.topAnchor.constraint(equalTo: moneyLabel.bottomAnchor, constant: 30),
            spinIcon.centerXAnchor.constraint(equalTo: moneyLabel.centerXAnchor)
        ])
        spinIcon.setImage(UIImage(named: "SpinIcon"), for: .normal)
    }
    
    //MARK: - setupStepper
    private func setupStepper() {
        view.addSubview(customStepper)
        customStepper.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customStepper.heightAnchor.constraint(equalToConstant: 33),
            customStepper.topAnchor.constraint(equalTo: spinIcon.bottomAnchor, constant: 30),
            customStepper.centerXAnchor.constraint(equalTo: moneyLabel.centerXAnchor)
        ])
    }
    
    private func setupInfoTitle() {
        view.addSubview(infoTitle)
        infoTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoTitle.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -14),
            infoTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 306),
            infoTitle.widthAnchor.constraint(equalToConstant: 115),
            infoTitle.heightAnchor.constraint(equalToConstant: 97)
        ])
        
        infoTitle.text = "WIN: +500"
//        infoTitle.textAlignment = .center
        infoTitle.font = UIFont(name: K.Fonts.robotoBold, size: 22)
        infoTitle.textColor = .white
        
        viewModel.infoTitle.bind { infoTitle in
            DispatchQueue.main.async {
                self.infoTitle.text = infoTitle
            }
        }
    }
    
    private func setupSlotsPicker() {
        view.addSubview(slotsPicker)
        slotsPicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            slotsPicker.topAnchor.constraint(equalTo: view.topAnchor, constant: 56),
            slotsPicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 93),
            slotsPicker.widthAnchor.constraint(equalToConstant: 530),
            slotsPicker.heightAnchor.constraint(equalToConstant: 290)
        ])
        
        
    }
    
    //    фиксирую этот экран в портретном режиме
    override func viewWillAppear(_ animated: Bool) {
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.landscape, andRotateTo: UIInterfaceOrientation.landscapeRight)
    }
    
    //    после закрытия этого экрана разрешаю другим экранам менять ориентацию в зависимости от положения девайса
    override func viewWillDisappear(_ animated: Bool) {
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.all)
    }
    
}


struct SwiftUIController: UIViewControllerRepresentable {
    typealias UIViewControllerType = GameVC
    
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
