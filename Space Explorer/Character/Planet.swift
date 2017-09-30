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
        self.setScale(4.00)
        self.physicsBody = setupPhysicsBody(size: size)
        self.configureGravityField()
        self.shadowCastBitMask = 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureGravityField() {
        self.fieldNode?.strength = 0.00080
        self.fieldNode?.isExclusive = false
        self.fieldNode?.categoryBitMask = PhysicsCategory.planetCategory
        self.fieldNode?.region = SKRegion(radius: Float(size.width*2))
        self.fieldNode?.isEnabled = true
        self.addChild(self.fieldNode!)
    }
    
}

extension Planet: Physicable {
    func didBeginContact(contact: SKPhysicsContact) {
        
    }
    
    func didEndContact(contact: SKPhysicsContact) {
        
    }
    
    func setupPhysicsBody(size: CGSize) -> SKPhysicsBody {
        
        let physicsBody = SKPhysicsBody(circleOfRadius: size.width/2)
        physicsBody.categoryBitMask = PhysicsCategory.planetCategory
        physicsBody.collisionBitMask = PhysicsCategory.bulletCategory | PhysicsCategory.meteorCategory | PhysicsCategory.shipCategory | PhysicsCategory.planetCategory
        physicsBody.contactTestBitMask = PhysicsCategory.bulletCategory | PhysicsCategory.meteorCategory | PhysicsCategory.shipCategory
        physicsBody.mass = 10000000000
        physicsBody.fieldBitMask = 0
        return physicsBody
        
    }
        
}
