//
//  UserMoney.swift
//  SlotsGames
//
//  Created by Veronica Rudiuk on 27/12/2022.
//

import Foundation

struct UserMoney {
    private let defaults = UserDefaults.standard
    
    func setupUserMoney(){
        defaults.set(500, forKey: "userMoney")
    }
    
    func setUserMoney(value: Int){
        defaults.set(value, forKey: "userMoney")
    }
    
    func getUserMoney() -> Int {
        defaults.integer(forKey: "userMoney")
    }
}
