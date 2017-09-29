//
//  GameLayer+TouchesEvents.swift
//  Pong
//
//  Created by Marcos Morais on 22/09/2017.
//  Copyright © 2017 Marcos Morais. All rights reserved.
//

import SpriteKit

extension GameLayer {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)

        }
        
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)

        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
}
