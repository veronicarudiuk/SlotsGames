//
//  GameVC.swift
//  SlotsGames
//
//  Created by Veronica Rudiuk on 24.12.22.
//

import UIKit

class GameVC: UIViewController {
    lazy var mainBackground = UIImageView()
    lazy var spinBackground = UIImageView()
    lazy var homeButton = UIButton()
    lazy var chestIcon = UIImageView()
    lazy var moneyLabel = UILabel()
    lazy var spinButton = UIButton()
    lazy var customStepper = CustomStepper()
    lazy var resultLabel = UILabel()
    lazy var slotsPicker = UIPickerView()
    
    lazy var viewModel = GameViewModel()
    lazy var dynamicConst = DynamicConstraintsManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        slotsPicker.dataSource = self
        slotsPicker.delegate = self
        setupBackgrounds()
        setupMoneySection()
        setupSpinButton()
        setupStepper()
        setupSlotsPicker()
        setupResultLabel()
        setupHomeButton()
        bindViewModel()
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
            spinBackground.widthAnchor.constraint(equalToConstant: dynamicConst.constraintLandscape(238)),
            spinBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    //MARK: - setupMoneySection
    private func setupMoneySection() {
        view.addSubview(chestIcon)
        view.addSubview(moneyLabel)
        chestIcon.translatesAutoresizingMaskIntoConstraints = false
        moneyLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chestIcon.topAnchor.constraint(equalTo: view.topAnchor, constant: dynamicConst.constraintLandscape(20)),
            chestIcon.leadingAnchor.constraint(equalTo: moneyLabel.leadingAnchor, constant: dynamicConst.constraintLandscape(28)),
            chestIcon.widthAnchor.constraint(equalToConstant: dynamicConst.constraintLandscape(115)),
            chestIcon.heightAnchor.constraint(equalToConstant: dynamicConst.constraintLandscape(97)),
            
            moneyLabel.topAnchor.constraint(equalTo: chestIcon.topAnchor, constant: dynamicConst.constraintLandscape(72)),
            moneyLabel.leadingAnchor.constraint(equalTo: spinBackground.leadingAnchor, constant: dynamicConst.constraintLandscape(21)),
            moneyLabel.heightAnchor.constraint(equalToConstant: dynamicConst.constraintLandscape(30)),
            moneyLabel.widthAnchor.constraint(equalToConstant: dynamicConst.constraintLandscape(170)),
        ])
        moneyLabel.text = String(viewModel.userMoney.getUserMoney())
        moneyLabel.textAlignment = .center
        moneyLabel.font = UIFont(name: K.Fonts.robotoBold, size: 22)
        moneyLabel.textColor = .tintColor
        moneyLabel.backgroundColor = UIColor(patternImage: UIImage(named: "AmountBGOrange")!)
        moneyLabel.layer.masksToBounds = true
        moneyLabel.layer.cornerRadius = 3
        
        chestIcon.image = UIImage(named: "ChestIcon")
    }
    
    //MARK: - setupSpinButton
    private func setupSpinButton() {
        view.addSubview(spinButton)
        spinButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            spinButton.widthAnchor.constraint(equalToConstant: dynamicConst.constraintLandscape(150)),
            spinButton.heightAnchor.constraint(equalToConstant: dynamicConst.constraintLandscape(150)),
            spinButton.topAnchor.constraint(equalTo: moneyLabel.bottomAnchor, constant: dynamicConst.constraintLandscape(30)),
            spinButton.centerXAnchor.constraint(equalTo: moneyLabel.centerXAnchor)
        ])
        spinButton.setImage(UIImage(named: "SpinIcon"), for: .normal)
        spinButton.addTarget(target, action: #selector(spinButtonPressed(_:)), for: .touchUpInside)
    }
    
    @objc private func spinButtonPressed(_ sender: UIButton) {
        for i in 0..<viewModel.gameSlotsPack.numberOfColumns {
            slotsPicker.selectRow((viewModel.randomNumber()), inComponent: i, animated: true)
            viewModel.setCurrentLine(slotsPicker.selectedRow(inComponent: i))
        }
        viewModel.slotsCheck()
        AnimationManager.buttonPressAnimation(sender: sender)
        viewModel.currentLine = []
    }
    
    //MARK: - setupStepper
    private func setupStepper() {
        view.addSubview(customStepper)
        customStepper.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customStepper.heightAnchor.constraint(equalToConstant: dynamicConst.constraintLandscape(33)),
            customStepper.topAnchor.constraint(equalTo: spinButton.bottomAnchor, constant: dynamicConst.constraintLandscape(30)),
            customStepper.centerXAnchor.constraint(equalTo: moneyLabel.centerXAnchor)
        ])
        customStepper.maxValue = viewModel.userMoney.getUserMoney()
    }
    
    //MARK: - setupSlotsPicker
    private func setupSlotsPicker() {
        view.addSubview(slotsPicker)
        slotsPicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            slotsPicker.topAnchor.constraint(equalTo: view.topAnchor, constant: dynamicConst.constraintLandscape(56)),
            slotsPicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: dynamicConst.constraintLandscape(93)),
            slotsPicker.widthAnchor.constraint(equalToConstant: dynamicConst.constraintLandscape(530)),
            slotsPicker.heightAnchor.constraint(equalToConstant: dynamicConst.constraintLandscape(290))
        ])
        
        slotsPicker.isUserInteractionEnabled = false
        
        for i in 0..<slotsPicker.numberOfComponents {
            slotsPicker.selectRow(viewModel.randomNumber(), inComponent: i, animated: true)
        }
    }
    
    //MARK: - setupResultLabel
    private func setupResultLabel() {
        view.addSubview(resultLabel)
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            resultLabel.centerYAnchor.constraint(equalTo: customStepper.centerYAnchor),
            resultLabel.centerXAnchor.constraint(equalTo: slotsPicker.centerXAnchor),
            resultLabel.heightAnchor.constraint(equalToConstant: 97)
        ])
        resultLabel.text = "LET'S SPIN! ➡️"
        resultLabel.font = UIFont(name: K.Fonts.robotoBold, size: 22)
        resultLabel.textColor = .white
    }
    
    //MARK: - setupHomeButton
    private func setupHomeButton() {
        homeButton.setImage(UIImage(named: "HomeIcon"), for: .normal)
        homeButton.addTarget(target, action: #selector(homeButtonAction(_:)), for: .touchUpInside)
        
        view.addSubview(homeButton)
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            homeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: dynamicConst.constraintLandscape(25)),
            homeButton.trailingAnchor.constraint(equalTo: slotsPicker.leadingAnchor, constant: -dynamicConst.constraintLandscape(32)),
            homeButton.heightAnchor.constraint(equalToConstant: 25),
            homeButton.widthAnchor.constraint(equalToConstant: 26)
        ])
    }
    
    @objc private func homeButtonAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - bindViewModel
    func bindViewModel() {
        viewModel.infoTitle.bind { infoTitle in
            DispatchQueue.main.async {
                self.resultLabel.text = infoTitle
            }
        }
        
        viewModel.currentMoney.bind { newValue in
            DispatchQueue.main.async {
//                self.moneyLabel.text = String(newValue)
                AnimationManager.textChangeAnimation(sender: self.moneyLabel, newValue: newValue)
                self.customStepper.maxValue = newValue
//                AnimationManager.textChangeAnimation(sender: self.moneyLabel)
            }
        }
        
        customStepper.value.bind { newValue in
            self.viewModel.currentRate = newValue
            print(self.viewModel.currentRate)
        }
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

//MARK: - UIPickerViewDataSource
extension GameVC: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        viewModel.gameSlotsPack.numberOfColumns
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        viewModel.gameSlotsPack.slotsPackImages.count * 3
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat { dynamicConst.constraintLandscape(90)
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat { dynamicConst.constraintLandscape(90)
    }
}

//MARK: - UIPickerViewDelegate
extension GameVC: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerView = UIView()
        let pickerImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: dynamicConst.constraintLandscape(90), height: dynamicConst.constraintLandscape(90)))
        pickerImageView.image = UIImage(named: (viewModel.makeBigSlotsArray()[row]))
        pickerView.addSubview(pickerImageView)
        return pickerView
    }
}
