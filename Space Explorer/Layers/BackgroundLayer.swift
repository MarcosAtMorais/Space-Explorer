//
//  BackgorundLayer.swift
//  Pong
//
//  Created by Marcos Morais on 22/09/2017.
//  Copyright © 2017 Marcos Morais. All rights reserved.
//

import SpriteKit

class BackgroundLayer: SKNode {
    
    init(size: CGSize) {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createStarsEffect() {
        
        let stars = SKEmitterNode(fileNamed: "StarsParticle")
        stars?.resetSimulation()
        stars?.targetNode = self
        (self.scene as! GameScene).gameLayer.ship.addChild(stars!)
        
    }

}
