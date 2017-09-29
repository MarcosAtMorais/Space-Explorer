//
//  HudLayer.swift
//  Pong
//
//  Created by Marcos Morais on 22/09/2017.
//  Copyright © 2017 Marcos Morais. All rights reserved.
//

import SpriteKit

class HudLayer: SKNode {
    
    let joystick = 🕹(diameter: 100, colors: (UIColor.white, UIColor.lightGray))
    var delegate: AnalogStickDelegate?
    
    init(size: CGSize) {
        super.init()
        self.joystick.position = CGPoint(x: size.width*0.20, y: size.height*0.20)
        self.joystick.substrate.color = .white
        self.joystick.stick.color = .gray
        self.zPosition = 10
        
        self.addChild(self.joystick)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            self.joystick.position = location
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if location.x < (self.scene?.size.width)!/2 {
//                self.joystick.isHidden = true
            }
        }
    }
    
}
