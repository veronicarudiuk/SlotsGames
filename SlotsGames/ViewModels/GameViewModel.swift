//
//  GameViewModel.swift
//  SlotsGames
//
//  Created by Veronica Rudiuk on 27/12/2022.
//

import Foundation

struct GameViewModel {
    
    var gameSlotsPack = SlotsGameModel(slotsPackImages: [], numberOfColumns: 0)
    let infoTitle = Box("")
    var userMoney = UserMoney().getUserMoney()
}
