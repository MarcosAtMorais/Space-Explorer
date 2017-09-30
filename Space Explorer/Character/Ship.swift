//
//  Ship.swift
//  Space Explorer
//
//  Created by Marcos Morais on 29/09/2017.
//  Copyright © 2017 Marcos Morais. All rights reserved.
//

import SpriteKit

class Ship : GameObject {
    
    var shipCurrentVelocity: CGVector! = CGVector(dx: 100, dy: 100)
    
    override init() {
        super.init()
    }
    
    init(position: CGPoint, size: CGSize) {
        super.init(withRectOf: size)
        self.physicsBody = self.setupPhysicsBody(size: size)
        self.fillColor = .white
        self.position = position
        self.createSpaceshipLight()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Bulletstorm!
    
    func createBullet() {
        let bullet = Bullet(position: self.position, color: .darkGray, velocity: shipCurrentVelocity!)
        self.parent?.addChild(bullet)
        bullet.run(removeBullet())
        bullet.applyImpulseAccordingToVelocity(velocity: CGVector(dx: (shipCurrentVelocity?.dx)!*10, dy: (shipCurrentVelocity?.dy)!*10))

        // Criar balas continuamente
        
    }
    
    func removeBullet() -> SKAction{
        let wait = SKAction.wait(forDuration: 5)
        let remove = SKAction.removeFromParent()
        let sequence = SKAction.sequence([wait, remove])
        
        return sequence
    }
    
    // Smoke Effect
    
    func createSmokeEffect() {
        
        let emitter = SKEmitterNode(fileNamed: "SmokeParticle")
        emitter?.resetSimulation()
        emitter?.targetNode = self.parent!
        self.addChild(emitter!)
        
    }
    
    // Light Node
    
    func createSpaceshipLight() {
        
        let lightNode = SKLightNode()
        lightNode.shadowColor = .black
        lightNode.ambientColor = .lightGray
        lightNode.alpha = 0.5
        self.addChild(lightNode)
        
    }
    
}

extension Ship : Physicable {
    func didBeginContact(contact: SKPhysicsContact) {
        // Começou o contato
    }
    
    func didEndContact(contact: SKPhysicsContact) {
        // Terminou o contato
    }
    
}

extension Ship: Shootable {
    func startShooting() {
        let createBullet = SKAction.run {
            self.createBullet()
        }
        let wait = SKAction.wait(forDuration: 10)
        let sequence = SKAction.sequence([createBullet, wait])
        let repeatForever = SKAction.repeatForever(sequence)
        self.run(repeatForever, withKey: "shootingAction")
        
    }
    
    func stopShooting() {
        self.removeAction(forKey: "shootingAction")
    }
}

extension Ship {

    func handlerTracking(data: AnalogJoystickData) {
        let xScale: CGFloat = 1000.0 // ajuste como quiser
        let yScale: CGFloat = 1000.0 // ajuste como quiser
        
        let xAdd = xScale * data.velocity.x
        let yAdd = yScale * data.velocity.y

        self.shipCurrentVelocity = CGVector(dx: xAdd, dy: yAdd)
        self.physicsBody?.applyForce(CGVector(dx: xAdd, dy: yAdd))
    }

}
