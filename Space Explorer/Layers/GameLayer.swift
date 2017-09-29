//
//  GameLayer.swift
//  Pong
//
//  Created by Marcos Morais on 22/09/2017.
//  Copyright © 2017 Marcos Morais. All rights reserved.
//

import SpriteKit

class GameLayer: SKNode {
    
    // MARK: Atributos essenciais
    var delegate: Updatable?
    var ship: Ship!

    // MARK: Construtor
    init(size: CGSize) {
        super.init()
        self.delegate = self
        self.createShip(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Métodos iniciais essenciais
    
    func createShip(size: CGSize) {
        self.ship = Ship(position: CGPoint(x: size.width/2, y: size.height/2), size: CGSize(width: 5, height: 5))
        self.addChild(self.ship)
    }
    
    func addAllCharacters(characters: [GameObject]) {
        
    }
    
}
