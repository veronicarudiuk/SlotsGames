//
//  Box.swift
//  SlotsGames
//
//  Created by Veronica Rudiuk on 27.12.22.
//

import Foundation

class Box<T> {
    typealias Listener = (T) -> Void
    
    private var listener: Listener?
    
    func bind(_ listener: Listener?) {
        self.listener = listener
    }
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ v: T) {
        value = v
    }
}
