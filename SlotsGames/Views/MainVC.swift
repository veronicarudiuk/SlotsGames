//
//  MainVC.swift
//  SlotsGames
//
//  Created by Veronica Rudiuk on 24.12.22.
//

import UIKit

class MainVC: UIViewController {
    private let profileIcon = UIImageView()
    private let chestIcon = UIImageView()
    private let moneyLabel = UILabel()
    private let darkBackground = UIView()
    private let popularButton = UIButton()
    private let allGamesButton = UIButton()
    private let redUnderlinePopular = UIImageView()
    private let redUnderlineAll = UIImageView()
    private let slotsGameOneButton = UIButton()
    private let slotsGameTwoButton = UIButton()
    private let slotsGameThreeButton = UIButton()
    
    private let viewModel = MainViewModel()
    private let dynamic = DynamicConstraintsManager()
    
    private let controlButtonsView = UIView()
    lazy var horizontalStackView = UIStackView()
    lazy var verticalStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: K.BrandColors.bottomBG)
        navigationController?.isNavigationBarHidden = true
        setupDarkBackground()
        setupHeaderView()
        setupControlButtons()
        setupSlotsGameImages()
    }
    
    //MARK: - setupDarkBackground
    private func setupDarkBackground() {
        darkBackground.backgroundColor = UIColor(named: K.BrandColors.topBG)
        darkBackground.layer.cornerRadius = 50
        darkBackground.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        view.addSubview(darkBackground)
        darkBackground.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            darkBackground.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            darkBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            darkBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            darkBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    //MARK: - setupHeaderView
    func setupHeaderView() {
        let headerView = UIView()
        let moneyView = UIView()
        
        view.addSubview(headerView)
        headerView.addSubview(profileIcon)
        headerView.addSubview(moneyView)
        moneyView.addSubview(moneyLabel)
        moneyView.addSubview(chestIcon)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        moneyView.translatesAutoresizingMaskIntoConstraints = false
        profileIcon.translatesAutoresizingMaskIntoConstraints = false
        moneyLabel.translatesAutoresizingMaskIntoConstraints = false
        chestIcon.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.bottomAnchor.constraint(equalTo: darkBackground.topAnchor),
            
            chestIcon.topAnchor.constraint(equalTo: moneyView.topAnchor),
            chestIcon.bottomAnchor.constraint(equalTo: moneyView.bottomAnchor),
            chestIcon.leadingAnchor.constraint(equalTo: moneyView.leadingAnchor),
            chestIcon.trailingAnchor.constraint(equalTo: moneyLabel.trailingAnchor, constant: -103),
            chestIcon.heightAnchor.constraint(equalToConstant: 45),
            chestIcon.widthAnchor.constraint(equalToConstant: 53.62),
            
            moneyLabel.trailingAnchor.constraint(equalTo: moneyView.trailingAnchor),
            moneyLabel.centerYAnchor.constraint(equalTo: moneyView.centerYAnchor),
            moneyLabel.widthAnchor.constraint(equalToConstant: 124),
            moneyLabel.heightAnchor.constraint(equalToConstant: 26),
            
            profileIcon.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 34),
            profileIcon.heightAnchor.constraint(equalToConstant: 45),
            profileIcon.widthAnchor.constraint(equalToConstant: 45),
            profileIcon.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            
            moneyView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -34),
            moneyView.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
        ])
        
        chestIcon.image = UIImage(named: "ChestIcon")
        profileIcon.image = UIImage(named: "ProfileIcon")
        moneyLabel.textAlignment = .center
        moneyLabel.font = UIFont(name: K.Fonts.robotoBold, size: 18)
        moneyLabel.textColor = .white
        moneyLabel.backgroundColor = .tintColor
        moneyLabel.layer.masksToBounds = true
        moneyLabel.layer.cornerRadius = 3
    }
    
    //MARK: - setupControlButtons and setupButtonImages
    private func setupControlButtons() {
        view.addSubview(controlButtonsView)
        controlButtonsView.addSubview(popularButton)
        controlButtonsView.addSubview(allGamesButton)
        controlButtonsView.addSubview(redUnderlinePopular)
        controlButtonsView.addSubview(redUnderlineAll)
        
        popularButton.translatesAutoresizingMaskIntoConstraints = false
        allGamesButton.translatesAutoresizingMaskIntoConstraints = false
        controlButtonsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            controlButtonsView.topAnchor.constraint(equalTo: darkBackground.topAnchor, constant: 29),
            controlButtonsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            popularButton.leadingAnchor.constraint(equalTo: controlButtonsView.leadingAnchor),
            popularButton.topAnchor.constraint(equalTo: controlButtonsView.topAnchor),
            popularButton.trailingAnchor.constraint(equalTo: allGamesButton.leadingAnchor, constant: -115),
            allGamesButton.topAnchor.constraint(equalTo: controlButtonsView.topAnchor),
            allGamesButton.trailingAnchor.constraint(equalTo: controlButtonsView.trailingAnchor)
        ])
        
        popularButton.isSelected = true
        redUnderlineAll.isHidden = true
        controlButtonsApperance()
        
        setupControlButtonImage(image: redUnderlinePopular, connectedButton: popularButton, buttonsView: controlButtonsView)
        setupControlButtonImage(image: redUnderlineAll, connectedButton: allGamesButton, buttonsView: controlButtonsView)
        
        popularButton.addTarget(target, action: #selector(controlButtonPressed(_:)), for: .touchUpInside)
        allGamesButton.addTarget(target, action: #selector(controlButtonPressed(_:)), for: .touchUpInside)
    }
    
    //    ?????????????????? ???????????????? ???????? ????????????
    private func controlButtonsApperance() {
        popularButton.setTitle("Popular", for: .normal)
        popularButton.setTitle("Popular", for: .selected)
        allGamesButton.setTitle("All Games", for: .normal)
        allGamesButton.setTitle("All Games", for: .selected)
        for button in [popularButton, allGamesButton] {
            button.setTitleColor(.white, for: .selected)
            button.setTitleColor(UIColor(named: K.BrandColors.lightGrayText), for: .normal)
            switch button.isSelected {
            case true:
                button.titleLabel?.font = UIFont(name: K.Fonts.sfProDisplayBold, size: 20)
            case false:
                button.titleLabel?.font = UIFont(name: K.Fonts.sfProDisplayRegular, size: 20)
            }
        }
    }
    
    //    ???????????????????? ?????????????? ?????????? ?????? ??????????????
    private func setupControlButtonImage(image: UIImageView, connectedButton: UIButton, buttonsView: UIView) {
        view.addSubview(image)
        image.image = UIImage(named: "RedUnderline")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.topAnchor.constraint(equalTo: connectedButton.bottomAnchor, constant: 3).isActive = true
        image.centerXAnchor.constraint(equalTo: connectedButton.centerXAnchor).isActive = true
        image.bottomAnchor.constraint(equalTo: buttonsView.bottomAnchor).isActive = true
    }
    
    //    ?????????????????? ?????????????????? ???????????? ?????? ?????????????? ???? ????????????
    @objc private func controlButtonPressed(_ sender: UIButton) {
        AnimationManager.buttonPressAnimation(sender: sender)
        popularButton.isSelected = !popularButton.isSelected
        redUnderlinePopular.isHidden = !redUnderlinePopular.isHidden
        allGamesButton.isSelected = !allGamesButton.isSelected
        redUnderlineAll.isHidden = !redUnderlineAll.isHidden
        slotsGameTwoButton.isHidden = !slotsGameTwoButton.isHidden
        slotsGameThreeButton.isHidden = !slotsGameThreeButton.isHidden
        controlButtonsApperance()
    }
    
    //MARK: - setupSlotsGameImages
    private func setupSlotsGameImages() {
        horizontalStackView = UIStackView(arrangedSubviews: [slotsGameTwoButton, slotsGameThreeButton], axis: .horizontal, spacing: 16)
        verticalStackView = UIStackView(arrangedSubviews: [slotsGameOneButton, horizontalStackView], axis: .vertical, spacing: 20)
        
        view.addSubview(verticalStackView)
        verticalStackView.addSubview(slotsGameOneButton)
        verticalStackView.addSubview(horizontalStackView)
        horizontalStackView.addSubview(slotsGameTwoButton)
        horizontalStackView.addSubview(slotsGameThreeButton)
        
        for button in [slotsGameOneButton, slotsGameTwoButton, slotsGameThreeButton] {
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(target, action: #selector(openGameAction(_:)), for: .touchUpInside)
        }
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            horizontalStackView.heightAnchor.constraint(equalToConstant: dynamic.constraintPortrait(165)),
            horizontalStackView.widthAnchor.constraint(equalToConstant: dynamic.constraintPortrait(346)),
            
            verticalStackView.topAnchor.constraint(equalTo: controlButtonsView.bottomAnchor, constant: dynamic.constraintPortrait(36)),
            verticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            verticalStackView.widthAnchor.constraint(equalToConstant: dynamic.constraintPortrait(346)),
            verticalStackView.heightAnchor.constraint(equalToConstant: dynamic.constraintPortrait(350))
            
        ])
        
        slotsGameOneButton.setImage(UIImage(named: "GamePic1"), for: .normal)
        slotsGameTwoButton.setImage(UIImage(named: "GamePic2"), for: .normal)
        slotsGameThreeButton.setImage(UIImage(named: "GamePic3"), for: .normal)
        
        slotsGameOneButton.tag = 0
        slotsGameTwoButton.tag = 1
        slotsGameThreeButton.tag = 2
        
        slotsGameTwoButton.isHidden = true
        slotsGameThreeButton.isHidden = true
    }
    
    @objc private func openGameAction(_ sender: UIButton) {
        let gameVC = GameVC()
        gameVC.viewModel.gameSlotsPack = viewModel.getSlotsPack(gameNumber: sender.tag)
        navigationController?.pushViewController(gameVC, animated: true)
    }
    
    
    //    ???????????????? ???????? ?????????? ?? ???????????????????? ????????????
    override func viewWillAppear(_ animated: Bool) {
        ScreenLocker.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
        moneyLabel.text = String(UserMoney().getUserMoney())
    }
    
    //    ?????????? ???????????????? ?????????? ???????????? ???????????????? ???????????? ?????????????? ???????????? ???????????????????? ?? ?????????????????????? ???? ?????????????????? ??????????????
    override func viewWillDisappear(_ animated: Bool) {
        ScreenLocker.lockOrientation(UIInterfaceOrientationMask.all)
    }
}
