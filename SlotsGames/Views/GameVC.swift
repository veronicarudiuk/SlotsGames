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
    
    var viewModel = GameViewModel()
    
    private var player = AudioManager()
    
    var component1 = [Int]()
    var component2 = [Int]()
    var component3 = [Int]()
    var component4 = [Int]()
    var component5 = [Int]()
    
    func randomNumber() -> Int {
        return Int.random(in: 0...8)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgrounds()
        setupHomeButton()
        setupMoneySection()
        setupSpinButton()
        setupStepper()
        setupResultLabel()
        setupSlotsPickerConstraints()
        navigationController?.isNavigationBarHidden = true
        slotsPicker.dataSource = self
        slotsPicker.delegate = self
        slotsPicker.isUserInteractionEnabled = false
        
        for _ in 0...8 {
            component1.append(randomNumber())
            component2.append(randomNumber())
            component3.append(randomNumber())
            component4.append(randomNumber())
            component5.append(randomNumber())
        }
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
    
    //MARK: - setupSpinButton
    private func setupSpinButton() {
        view.addSubview(spinButton)
        spinButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            spinButton.widthAnchor.constraint(equalToConstant: 150),
            spinButton.heightAnchor.constraint(equalToConstant: 150),
            spinButton.topAnchor.constraint(equalTo: moneyLabel.bottomAnchor, constant: 30),
            spinButton.centerXAnchor.constraint(equalTo: moneyLabel.centerXAnchor)
        ])
        spinButton.setImage(UIImage(named: "SpinIcon"), for: .normal)
        spinButton.addTarget(target, action: #selector(spinButtonPressed(_:)), for: .touchUpInside)
    }
    
    @objc private func spinButtonPressed(_ sender: UIButton) {
        player.playSound(soundName: K.Sounds.pullSound)
        
        slotsPicker.selectRow((randomNumber()), inComponent: 0, animated: true)
        slotsPicker.selectRow((randomNumber()), inComponent: 1, animated: true)
        slotsPicker.selectRow((randomNumber()), inComponent: 2, animated: true)
        slotsPicker.selectRow((randomNumber()), inComponent: 3, animated: true)
        slotsPicker.selectRow((randomNumber()), inComponent: 4, animated: true)
        
        if(component1[slotsPicker.selectedRow(inComponent: 0)] == component2[slotsPicker.selectedRow(inComponent: 0)]) {
            resultLabel.text = "Win!"
            player.playSound(soundName: K.Sounds.winSound)
        } else {
            resultLabel.text = "Play again"
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1, options: .curveEaseOut) {
            self.spinButton.bounds.size.width += 10
        }
    }

    
    //MARK: - setupStepper
    private func setupStepper() {
        view.addSubview(customStepper)
        customStepper.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customStepper.heightAnchor.constraint(equalToConstant: 33),
            customStepper.topAnchor.constraint(equalTo: spinButton.bottomAnchor, constant: 30),
            customStepper.centerXAnchor.constraint(equalTo: moneyLabel.centerXAnchor)
        ])
    }
    
    //MARK: - setupResultLabel
    private func setupResultLabel() {
        view.addSubview(resultLabel)
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            resultLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -14),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 306),
            resultLabel.widthAnchor.constraint(equalToConstant: 115),
            resultLabel.heightAnchor.constraint(equalToConstant: 97)
        ])
        
        resultLabel.text = "WIN: +500"
        resultLabel.font = UIFont(name: K.Fonts.robotoBold, size: 22)
        resultLabel.textColor = .white
        
        viewModel.infoTitle.bind { infoTitle in
            DispatchQueue.main.async {
                self.resultLabel.text = infoTitle
            }
        }
    }
    
    //MARK: - setupSlotsPickerConstraints
    private func setupSlotsPickerConstraints() {
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

//MARK: - UIPickerViewDataSource
extension GameVC: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        viewModel.gameSlotsPack.numberOfColumns
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        viewModel.gameSlotsPack.slotsPackImages.count
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        90
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        90
    }
}

//MARK: - UIPickerViewDelegate
extension GameVC: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let pickerView = UIView()
        
        let pickerImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 90, height: 90))
        
        switch component {
        case 0:
            pickerImageView.image = UIImage(named: viewModel.gameSlotsPack.slotsPackImages[component1[row]])
            break
        case 1:
            pickerImageView.image = UIImage(named: viewModel.gameSlotsPack.slotsPackImages[component2[row]])
            break
        case 2:
            pickerImageView.image = UIImage(named: viewModel.gameSlotsPack.slotsPackImages[component3[row]])
            break
        case 3:
            pickerImageView.image = UIImage(named: viewModel.gameSlotsPack.slotsPackImages[component4[row]])
            break
        case 4:
            pickerImageView.image = UIImage(named: viewModel.gameSlotsPack.slotsPackImages[component5[row]])
            break
        default:
            pickerImageView.image = UIImage(named: viewModel.gameSlotsPack.slotsPackImages[component1[row]])
        }
        
        pickerView.addSubview(pickerImageView)
        return pickerView
    }
}
