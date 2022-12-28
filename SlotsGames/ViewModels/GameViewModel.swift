//
//  GameViewModel.swift
//  SlotsGames
//
//  Created by Veronica Rudiuk on 27/12/2022.
//

import Foundation

struct GameViewModel {
    
    lazy var gameSlotsPack = SlotsGameModel(slotsPackImages: [], numberOfColumns: 0)
    lazy var infoTitle = Box(String())
    lazy var currentMoney = Box(Int())
    lazy var currentLine = [Int]()
    lazy var currentRate = 50
    private var winAmount = Int()
    private var loseAmount = Int()
    private let player = AudioManager()
    let userMoney = UserMoney()
    
    func randomNumber() -> Int {
        return Int.random(in: 9...17)
    }
    
    mutating func makeBigSlotsArray() -> [String] {
        var bigSlotsArray = [String]()
        for _ in 1...3 {
            bigSlotsArray.append(contentsOf: gameSlotsPack.slotsPackImages)
        }
        return bigSlotsArray
    }
    
    mutating func setCurrentLine(_ slotIndex: Int) {
        currentLine.append(slotIndex)
    }
    
    mutating func slotsCheck() {
        player.playSound(soundName: K.Sounds.pullSound)
        let filter = Set(currentLine).count
        winAmount = 0
        loseAmount = 0
        switch filter {
        case 1:
            winAmount = currentRate * 5 // 5 из 5
        case 2:
            winAmount = currentRate * 2 // 4 из 5
        case 3:
            winAmount = currentRate // 3 из 5
        case 5:
            loseAmount = currentRate // 1 из 5
        default:
            break
        }
        infoTitleUpdate()
        userMoneyUpdate()
    }
    
    mutating private func infoTitleUpdate() {
        if winAmount != 0 {
            infoTitle.value = "WIN: +\(winAmount)"
            player.playSound(soundName: K.Sounds.winSound)
        } else if loseAmount != 0 {
            infoTitle.value = "LOSE: \(loseAmount)"
        } else {
            infoTitle.value = "NO LOSS, NO WIN"
        }
    }
    
    mutating private func userMoneyUpdate() {
        var bank = userMoney.getUserMoney()
        if winAmount != 0 {
            bank += winAmount
        } else if loseAmount != 0 {
            bank -= loseAmount
        }
        userMoney.setUserMoney(value: bank)
        currentMoney.value = bank
    }
}
