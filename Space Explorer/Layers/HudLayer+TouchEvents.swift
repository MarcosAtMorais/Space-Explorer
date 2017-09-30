//
//  HudLayer+TouchEvents.swift
//  Space Explorer
//
//  Created by Marcos Morais on 30/09/2017.
//  Copyright © 2017 Marcos Morais. All rights reserved.
//

import SpriteKit

extension HudLayer {
    
    // MARK: - Touch Events
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if location.x < 0 {
                if !self.joystick.tracking {
                    self.joystick.position = location
                    self.joystick.touchesBegan(touches, with: event)
                }
            }
            else {
                shootableDelegate?.stopShooting()
                shootableDelegate?.startShooting()
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if location.x > 0 {
                shootableDelegate?.stopShooting()
            }
            else{
                self.joystick.touchesMoved(touches, with: event)
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if location.x > 0 {
                shootableDelegate?.stopShooting()
            }
        }
    }
    
}
