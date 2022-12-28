//
//  DynamicConstraintsManager.swift
//  SlotsGames
//
//  Created by Veronica Rudiuk on 28/12/2022.
//

import UIKit

// помогает высчитывать констрейнты исходя из размера экрана девайса
struct DynamicConstraintsManager {
    
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height
    private let designScreenWidth = 414
    private let designScreenHeight = 896
    
    func constraintPortrait(_ designConstraint: Int) -> CGFloat {
        CGFloat((designConstraint * Int(screenWidth)) / designScreenWidth)
    }
    
    func constraintLandscape(_ designConstraint: Int) -> CGFloat {
        CGFloat((designConstraint * Int(screenHeight)) / designScreenHeight)
    }
}
