//
//  MainViewModel.swift
//  SlotsGames
//
//  Created by Veronica Rudiuk on 27/12/2022.
//

import Foundation

struct MainViewModel {
    let slotsGames = [
        SlotsGameModel(slotsPackImages: ["Icon1.1", "Icon1.2", "Icon1.3", "Icon1.4", "Icon1.5", "Icon1.6", "Icon1.7", "Icon1.8", "Icon1.9"], numberOfColumns: 5),
        SlotsGameModel(slotsPackImages: ["Icon2.1", "Icon2.2", "Icon2.3", "Icon2.4", "Icon2.5", "Icon2.6", "Icon2.7", "Icon2.8", "Icon2.9"], numberOfColumns: 5),
        SlotsGameModel(slotsPackImages: ["Icon3.1", "Icon3.2", "Icon3.3", "Icon3.4", "Icon3.5", "Icon3.6", "Icon3.7", "Icon3.8", "Icon3.9"], numberOfColumns: 5)]
    
    
    func getSlotsPack(gameNumber: Int) -> SlotsGameModel {
        return slotsGames[gameNumber]
    }
}
