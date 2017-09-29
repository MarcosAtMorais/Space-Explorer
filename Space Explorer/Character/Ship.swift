//
//  Ship.swift
//  Space Explorer
//
//  Created by Marcos Morais on 29/09/2017.
//  Copyright © 2017 Marcos Morais. All rights reserved.
//

import SpriteKit

class Ship : GameObject {
    
    override init() {
        super.init()
    }
    
    init(position: CGPoint, size: CGSize) {
        super.init(withRectOf: size)
        self.physicsBody = self.setupPhysicsBody(size: size)
        self.fillColor = .white
        self.position = position
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

extension Ship {

    func handlerTracking(data: AnalogJoystickData) {
        let xScale: CGFloat = 1000.0 // ajuste como quiser
        let yScale: CGFloat = 1000.0 // ajuste como quiser
        
        let xAdd = xScale * data.velocity.x
        let yAdd = yScale * data.velocity.y
        
        print(self.physicsBody?.velocity)
        self.physicsBody?.applyForce(CGVector(dx: xAdd, dy: yAdd))
        
    }

}
