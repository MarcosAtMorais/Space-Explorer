//
//  Bullet.swift
//  Space Explorer
//
//  Created by Marcos Morais on 30/09/2017.
//  Copyright © 2017 Marcos Morais. All rights reserved.
//

import SpriteKit

class Bullet: GameObject {
    
    private let bulletSize: CGSize = CGSize(width: 3.0, height: 3.0)
    private let velocityMultiplier:CGFloat = 10.00
    
    override init() {
        super.init()
    }
    
    init(position: CGPoint, color: UIColor, velocity: CGVector) {
        super.init(withEllipseOf: bulletSize)
        self.position = position
        self.physicsBody = setupPhysicsBody(size: bulletSize)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func applyImpulseAccordingToVelocity(velocity: CGVector) {
        self.physicsBody?.applyImpulse(velocity)
    }
    
}

extension Bullet: Physicable {
    func didBeginContact(contact: SKPhysicsContact) {
        
    }
    
    func didEndContact(contact: SKPhysicsContact) {
        
    }
    
    func setupPhysicsBody(size: CGSize) -> SKPhysicsBody {
        
        let physicsBody = SKPhysicsBody(circleOfRadius: size.width/2)
        physicsBody.categoryBitMask = PhysicsCategory.bulletCategory
        physicsBody.collisionBitMask = PhysicsCategory.planetCategory | PhysicsCategory.meteorCategory
        physicsBody.contactTestBitMask = PhysicsCategory.planetCategory | PhysicsCategory.meteorCategory
        physicsBody.mass = 1000
        return physicsBody
        
    }
}
