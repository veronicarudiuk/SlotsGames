//
//  AppDelegate.swift
//  SlotsGames
//
//  Created by Veronica Rudiuk on 24.12.22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var orientationLock = UIInterfaceOrientationMask.all
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return self.orientationLock
    }
    
    struct AppUtility {
        static func lockOrientation(_ orientation: UIInterfaceOrientationMask) {
            if let delegate = UIApplication.shared.delegate as? AppDelegate {
                delegate.orientationLock = orientation
            }
        }
        
        static func lockOrientation(_ orientation: UIInterfaceOrientationMask, andRotateTo rotateOrientation:UIInterfaceOrientation) {
            self.lockOrientation(orientation)
            UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
        }
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if UserDefaults.standard.integer(forKey: "userMoney") == 0 {
            UserMoney().setupUserMoney()
        }
        return true
    }
}

