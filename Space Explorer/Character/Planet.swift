//
//  Planet.swift
//  Space Explorer
//
//  Created by Marcos Morais on 30/09/2017.
//  Copyright © 2017 Marcos Morais. All rights reserved.
//

import SpriteKit

enum Planets: Int {
    case earth
    case mars
    case desert
    case pluto
    case pinky
}

class Planet: SKSpriteNode {
    
    let fieldNode: SKFieldNode?
    
    init(position: CGPoint, planetTexture: SKTexture) {
        self.fieldNode = SKFieldNode.radialGravityField()
        super.init(texture: planetTexture, color: .clear, size: planetTexture.size())
        self.position = position
        self.physicsBody = setupPhysicsBody(size: planetTexture.size())
        self.fieldNode?.strength = 0.005
        self.fieldNode?.isExclusive = false
        self.fieldNode?.categoryBitMask = PhysicsCategory.planetCategory
        self.fieldNode?.region = SKRegion(radius: Float(size.width*3))
        self.fieldNode?.isEnabled = true
        self.addChild(self.fieldNode!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension Planet: Physicable {
    func didBeginContact(contact: SKPhysicsContact) {
        
    }
    
    func didEndContact(contact: SKPhysicsContact) {
        
    }
    
    func setupPhysicsBody(size: CGSize) -> SKPhysicsBody {
        
        let physicsBody = SKPhysicsBody(texture: texture!, size: size)
        physicsBody.categoryBitMask = PhysicsCategory.planetCategory
        physicsBody.collisionBitMask = PhysicsCategory.bulletCategory | PhysicsCategory.meteorCategory | PhysicsCategory.shipCategory
        physicsBody.contactTestBitMask = PhysicsCategory.bulletCategory | PhysicsCategory.meteorCategory | PhysicsCategory.shipCategory
        physicsBody.mass = 100000
        return physicsBody
        
    }
        
}
