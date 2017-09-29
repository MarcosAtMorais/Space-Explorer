//
//  GameObject.swift
//  Space Explorer
//
//  Created by Marcos Morais on 22/09/2017.
//  Copyright © 2017 Marcos Morais. All rights reserved.
//

import SpriteKit

/**
 Estrutura que abrigará nossas categorias de física. Ela utiliza BitShift para ser mais rápida.
 */
struct PhysicsCategory {
    static let shipCategory: UInt32 = 0b1 << 1
    static let meteorCategory: UInt32 = 0b1 << 2
    static let planetCategory: UInt32 = 0b1 << 3
}

class GameObject: SKShapeNode {

    override init() {
        super.init()
        
    }
    
    init(withRectOf size: CGSize) {
        super.init()
        self.init(rectOf: size)
    }
    
    init(withEllipseOf size: CGSize) {
        super.init()
        self.init(ellipseOf: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
