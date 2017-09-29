//
//  GameState.swift
//  Space Explorer
//
//  Created by Marcos Morais on 29/09/2017.
//  Copyright © 2017 Marcos Morais. All rights reserved.
//

import Foundation

class GameState {
    
    //MARK: Shared Instance
    static let sharedInstance : GameState = {
        let instance = GameState()
        return instance
    }()
    
}
