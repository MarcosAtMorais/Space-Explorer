//
//  File.swift
//  Pong
//
//  Created by Marcos Morais on 22/09/2017.
//  Copyright © 2017 Marcos Morais. All rights reserved.
//

import Foundation
import SpriteKit

/**
 Se um objeto implementa Physicable, ele pode se beneficiar de métodos de física automaticamente no game.
 */
protocol Physicable {
    
    func setupPhysicsBody(size: CGSize) -> SKPhysicsBody
    func didBeginContact(contact: SKPhysicsContact)
    func didEndContact(contact: SKPhysicsContact)
    
}

extension Physicable {
    
    func setupPhysicsBody(size: CGSize) -> SKPhysicsBody {
        let physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody.categoryBitMask = PhysicsCategory.shipCategory
        physicsBody.collisionBitMask = PhysicsCategory.meteorCategory | PhysicsCategory.planetCategory
        physicsBody.contactTestBitMask = PhysicsCategory.meteorCategory | PhysicsCategory.planetCategory
        physicsBody.allowsRotation = false
        physicsBody.mass = 1000
        
        return physicsBody
    }
    
}
