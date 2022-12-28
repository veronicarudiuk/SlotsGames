//
//  PreloaderScreen.swift
//  SlotsGames
//
//  Created by Veronica Rudiuk on 28/12/2022.
//

import UIKit

class PreloaderScreen: UIViewController {
    
    let chestImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "ChestIcon")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let progressBar: UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .bar)
        progress.progressTintColor = UIColor(named: K.BrandColors.greenLoader)
        progress.trackTintColor = UIColor(named: K.BrandColors.lightGrayLoader)
        progress.layer.masksToBounds = true
        progress.layer.cornerRadius = 3
        progress.progress = 0.0
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }()
    
    let testTitle = UILabel()
    let appTitle = UILabel()
    let designTitle = UILabel()
    let textView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: K.BrandColors.bottomBG)
        setConstraints()
        setLabelsAppearance()
        DispatchQueue.main.asyncAfter(deadline: .now()+1) { //4
            let mainVC = MainVC()
            self.navigationController?.pushViewController(mainVC, animated: true)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        animation()
    }
    
    func animation() {
        UIView.animate(withDuration: 5.0) {
            self.progressBar.setProgress(1.0, animated: true)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            self.testTitle.textColor = UIColor(named: K.BrandColors.greenLoader)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            self.appTitle.textColor = UIColor(named: K.BrandColors.greenLoader)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            self.designTitle.textColor = UIColor(named: K.BrandColors.greenLoader)
        }
    }
    
    func setLabelsAppearance() {
        testTitle.attributedText = NSAttributedString(string: "Test", attributes: [.kern: 2])
        appTitle.attributedText = NSAttributedString(string: "App", attributes: [.kern: 2])
        designTitle.attributedText = NSAttributedString(string: "Design", attributes: [.kern: 2])
        let labels = [testTitle, appTitle, designTitle]
        for label in labels {
            label.textColor = .white
            label.font = UIFont(name: K.Fonts.sfProDisplayBold, size: 20)
            label.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func setConstraints() {
        let mainView = UIView()
        view.addSubview(mainView)
        mainView.addSubview(chestImage)
        mainView.addSubview(textView)
        mainView.addSubview(progressBar)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chestImage.topAnchor.constraint(equalTo: mainView.topAnchor),
            chestImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chestImage.heightAnchor.constraint(equalToConstant: 119),
            chestImage.widthAnchor.constraint(equalToConstant: 142),
            textView.topAnchor.constraint(equalTo: chestImage.bottomAnchor, constant: 24),
            textView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressBar.topAnchor.constraint(equalTo: chestImage.bottomAnchor, constant: 72),
            progressBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressBar.heightAnchor.constraint(equalToConstant: 4),
            progressBar.widthAnchor.constraint(equalToConstant: 338),
            progressBar.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
            progressBar.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            progressBar.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            
            mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        textView.addSubview(testTitle)
        textView.addSubview(appTitle)
        textView.addSubview(designTitle)
        NSLayoutConstraint.activate([
            testTitle.topAnchor.constraint(equalTo: textView.topAnchor),
            testTitle.leadingAnchor.constraint(equalTo: textView.leadingAnchor),
            appTitle.topAnchor.constraint(equalTo: textView.topAnchor),
            appTitle.leadingAnchor.constraint(equalTo: testTitle.trailingAnchor, constant: 12),
            appTitle.trailingAnchor.constraint(equalTo: designTitle.leadingAnchor, constant: -12),
            designTitle.topAnchor.constraint(equalTo: textView.topAnchor),
            designTitle.trailingAnchor.constraint(equalTo: textView.trailingAnchor)
        ])
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

